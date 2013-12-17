//
//  MRMarketolisManager.h
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMarketolis.h"

typedef void (^MRManagerCallback)(id result, NSError *error);

typedef NS_ENUM(NSInteger, MRMarketolisManagerState) {
    MRMarketolisManagerStateNone,
    MRMarketolisManagerStateConfirmation,
    MRMarketolisManagerStateIncomplete,
    MRMarketolisManagerStateWork
};

@interface MRMarketolisManager : MRMarketolisClient

@property (readonly, assign, nonatomic) MRMarketolisManagerState state;

@property (readonly, assign, nonatomic) int64_t userId;
@property (readonly, strong, nonatomic) NSString *token;
@property (readonly, assign, nonatomic) int64_t phone;

@property (strong, nonatomic) NSString *pushToken;

- (NSOperation *)loginByPhoneNumber:(int64_t )number callback:(MRManagerCallback)callback;
- (NSOperation *)confirmByCode:(NSString *)code callback:(MRManagerCallback)callback;
- (NSOperation *)resendCodeCallback:(MRManagerCallback)callback;
- (NSOperation *)completeWithName:(NSString *)name callback:(MRManagerCallback)callback;
- (void)logout;

+ (MRMarketolisManager *)sharedManager;

@end
