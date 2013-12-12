//
//  MRMarketolisManager.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMarketolisManager.h"

@implementation MRMarketolisManager

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSOperation *)loginByPhoneNumber:(int64_t )number
                           callback:(void (^)(id result, NSError *error))callback
{
    return [[self auth] loginByPhoneNumber:number callback:^(id result, NSError *error) {
        
    }];
}

- (NSOperation *)confirmPhoneNumber:(int64_t )number
                               code:(NSString *)code
                           callback:(void (^)(id result, NSError *error))callback
{
    return [[self auth] confirmPhoneNumber:number code:code pushToken:@"" callback:^(id result, NSError *error) {
        
    }];
}

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
