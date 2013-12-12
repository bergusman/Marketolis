//
//  MRPhoneHelper.h
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRPhoneHelper : NSObject

+ (NSString *)digitizeString:(NSString *)string;
+ (NSString *)formattedPhone:(NSString *)phone;
+ (BOOL)isValidPhone:(NSString *)phone; // 10 digits after digitizing

@end
