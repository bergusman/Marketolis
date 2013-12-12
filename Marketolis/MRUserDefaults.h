//
//  MRUserDefaults.h
//  Marketolis
//
//  Created by Vitaly Berg on 12/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRUserDefaults : NSObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSNumber *confirmatedPhone;

@property (strong, nonatomic) NSString *pushToken;

+ (MRUserDefaults *)sharedDefaults;

@end
