//
//  MRUserDefaults.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRUserDefaults.h"

@implementation MRUserDefaults

#pragma mark - Token

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"MRToken"];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"MRToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - UserId

- (NSNumber *)userId {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"MRUserId"];
}

- (void)setUserId:(NSNumber *)userId {
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"MRUserId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - ConfirmatedPhone

- (NSNumber *)confirmatedPhone {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"MRConfirmatedPhone"];
}

- (void)setConfirmatedPhone:(NSNumber *)confirmatedPhone {
    [[NSUserDefaults standardUserDefaults] setObject:confirmatedPhone forKey:@"MRConfirmatedPhone"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - PushToken

- (NSString *)pushToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"MRPushToken"];
}

- (void)setPushToken:(NSString *)pushToken {
    [[NSUserDefaults standardUserDefaults] setObject:pushToken forKey:@"MRPushToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Singleton

+ (MRUserDefaults *)sharedDefaults {
    static MRUserDefaults *_userDefaults;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userDefaults = [[MRUserDefaults alloc] init];
    });
    return _userDefaults;
}

@end
