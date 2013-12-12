//
//  MRMarketolisManager.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMarketolisManager.h"

@interface MRMarketolisManager ()

@property (readwrite, assign, nonatomic) MRMarketolisManagerState state;

@property (readwrite, assign, nonatomic) int64_t userId;
@property (readwrite, strong, nonatomic) NSString *token;
@property (readwrite, assign, nonatomic) int64_t phone;

@property (assign, nonatomic) int64_t confirmationPhone;

@end

@implementation MRMarketolisManager

- (id)init {
    self = [super init];
    if (self) {
        _pushToken = [MRUserDefaults sharedDefaults].pushToken;
        
        NSString *token = [MRUserDefaults sharedDefaults].token;
        NSNumber *userId = [MRUserDefaults sharedDefaults].userId;
        if (token && userId) {
            self.token = token;
            self.userId = [userId longLongValue];
            self.phone = [[MRUserDefaults sharedDefaults].confirmatedPhone longLongValue];
            self.state = MRMarketolisManagerStateWork;
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
}

#pragma mark - Auth

- (NSOperation *)loginByPhoneNumber:(int64_t )number callback:(MRManagerCallback)callback {
    return [[self auth] loginByPhoneNumber:number callback:^(id result, NSError *error) {
        NSLog(@"LoginByPhoneNumber: %@ %@", result, error);
        
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
        NSLog(@"ConfirmPhoneNumber: %@ %@", result, error);
        
        if (error) {
        } else {
            MRAuthResult *authResult = result;
            
            NSLog(@"%lld, %@", authResult.userId, authResult.token);
            NSLog(@"completed?: %d", authResult.complete);
            
            if (authResult.complete) {
                self.token = authResult.token;
                self.userId = authResult.userId;
                self.phone = self.confirmationPhone;
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

- (void)logout {
    [MRUserDefaults sharedDefaults].token = nil;
    self.state = MRMarketolisManagerStateNone;
}

#pragma mark - Singletons

+ (MRMarketolisManager *)sharedManager {
    static MRMarketolisManager *_sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PDRpcClient *rpcClient = [[PDRpcClient alloc] initWithDescriptor:MRMarketolisDescriptor() baseUrl:@"http://54.220.36.48/api"];
        _sharedManager = [[MRMarketolisManager alloc] initWithHandler:rpcClient];
    });
    return _sharedManager;
}

@end
