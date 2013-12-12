//
//  MRMarketolisManager.h
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMarketolis.h"

@interface MRMarketolisManager : MRMarketolisClient

- (NSOperation *)loginByPhoneNumber:(int64_t )number
                           callback:(void (^)(id result, NSError *error))callback;

- (NSOperation *)confirmPhoneNumber:(int64_t )number
                               code:(NSString *)code
                           callback:(void (^)(id result, NSError *error))callback;


+ (MRMarketolisManager *)sharedManager;

@end
