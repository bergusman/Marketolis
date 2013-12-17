//
//  MRMarketolisManager.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMarketolisManager.h"

#import "MRRPCClient.h"
#import <AFNetworking/AFNetworking.h>

@interface MRMarketolisManager ()

@property (readwrite, assign, nonatomic) MRMarketolisManagerState state;

@property (readwrite, assign, nonatomic) int64_t userId;
@property (readwrite, strong, nonatomic) NSString *token;
@property (readwrite, assign, nonatomic) int64_t phone;

@property (assign, nonatomic) int64_t confirmationPhone;

@property (strong, nonatomic) MRRPCClient *rpcClient;

@end

@implementation MRMarketolisManager

#pragma mark - Initing

+ (MRMarketolisManager *)marketolisManager {
    MRRPCClient *rpcClient = [[MRRPCClient alloc] initWithDescriptor:MRMarketolisDescriptor() baseUrl:@"http://54.220.36.48/api"];
    MRMarketolisManager *manager = [[MRMarketolisManager alloc] initWithHandler:rpcClient];
    manager.rpcClient = rpcClient;
    if (manager.state == MRMarketolisManagerStateWork) {
        rpcClient.authToken = manager.token;
    }
    return manager;
}

- (id)initWithHandler:(id<PDInvocationHandler>)handler parentInvocation:(PDInvocation *)parent {
    self = [super initWithHandler:handler parentInvocation:parent];
    if (self) {
        _pushToken = [MRUserDefaults sharedDefaults].pushToken;
        
        NSString *token = [MRUserDefaults sharedDefaults].token;
        NSNumber *userId = [MRUserDefaults sharedDefaults].userId;
        if (token && userId) {
            _token = token;
            _userId = [userId longLongValue];
            _phone = [[MRUserDefaults sharedDefaults].confirmatedPhone longLongValue];
            _state = MRMarketolisManagerStateWork;
        }
    }
    return self;
}

- (void)dumpTokenAndUser {
    [MRUserDefaults sharedDefaults].token = self.token;
    [MRUserDefaults sharedDefaults].userId = @(self.userId);
    [MRUserDefaults sharedDefaults].confirmatedPhone = @(self.phone);
}

#pragma mark - Push Token

- (void)setPushToken:(NSString *)pushToken {
    _pushToken = pushToken;
    [MRUserDefaults sharedDefaults].pushToken = pushToken;
    // TODO: send token to server
}

#pragma mark - Auth

- (NSOperation *)loginByPhoneNumber:(int64_t )number callback:(MRManagerCallback)callback {
    return [[self auth] loginByPhoneNumber:number callback:^(id result, NSError *error) {
        if (error) {
        } else {
            self.confirmationPhone = number;
            self.state = MRMarketolisManagerStateConfirmation;
        }
        
        if (callback) {
            callback(result, error);
        }
    }];
}

- (NSOperation *)confirmByCode:(NSString *)code callback:(MRManagerCallback)callback {
    NSString *pushToken = self.pushToken ?: @"";
    
    return [[self auth] confirmPhoneNumber:self.confirmationPhone code:code pushToken:pushToken callback:^(id result, NSError *error) {
        if (error) {
        } else {
            MRAuthResult *authResult = result;
            
            self.token = authResult.token;
            self.userId = authResult.userId;
            self.phone = self.confirmationPhone;
            
            self.rpcClient.authToken = self.token;
            
            if (authResult.complete) {
                [self dumpTokenAndUser];
                self.state = MRMarketolisManagerStateWork;
            } else {
                self.state = MRMarketolisManagerStateIncomplete;
            }
        }
        
        if (callback) {
            callback(result, error);
        }
    }];
}

- (NSOperation *)resendCodeCallback:(MRManagerCallback)callback {
    return [[self auth] loginByPhoneNumber:self.confirmationPhone callback:^(id result, NSError *error) {
        if (error) {
        } else {
        }
        
        if (callback) {
            callback(result, error);
        }
    }];
}

- (NSOperation *)completeWithName:(NSString *)name callback:(MRManagerCallback)callback {
    MREditableUserData *user = [[MREditableUserData alloc] init];
    user.name = name;
    
    return [[self users] updateId:self.userId data:user callback:^(id result, NSError *error) {
        if (error) {
        } else {
            [self dumpTokenAndUser];
            self.state = MRMarketolisManagerStateWork;
        }
        
        if (callback) {
            callback(result, error);
        }
    }];
}

- (void)logout {
    [MRUserDefaults sharedDefaults].token = nil;
    self.state = MRMarketolisManagerStateNone;
}

#pragma mark - Singleton

+ (MRMarketolisManager *)sharedManager {
    static MRMarketolisManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self marketolisManager];
    });
    return _sharedManager;
}

@end
