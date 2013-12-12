//
//  MRPhoneHelper.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPhoneHelper.h"

@implementation MRPhoneHelper

+ (NSString *)digitizeString:(NSString *)string {
    NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];
    return [[string componentsSeparatedByCharactersInSet:[digits invertedSet]] componentsJoinedByString:@""];
}

+ (NSString *)formattedPhone:(NSString *)phone {
    phone = [self digitizeString:phone];
    if ([phone length] == 0) {
        return @"";
    }
    
    NSMutableString *formattedPhone = [[NSMutableString alloc] init];
    NSString *temp;
    
    // (000)
    temp = [phone substringWithRange:NSMakeRange(0, MIN(3, [phone length]))];
    if ([phone length] > 3) {
        [formattedPhone appendFormat:@"(%@)", temp];
    } else {
        [formattedPhone appendFormat:@"(%@", temp];
    }
    
    if ([temp length] < 3) {
        return formattedPhone;
    }
    phone = [phone substringFromIndex:3];
    if ([phone length] == 0) {
        return formattedPhone;
    }
    
    // (000) 000
    temp = [phone substringWithRange:NSMakeRange(0, MIN(3, [phone length]))];
    [formattedPhone appendFormat:@" %@", temp];
    
    if ([temp length] < 3) {
        return formattedPhone;
    }
    phone = [phone substringFromIndex:3];
    if ([phone length] == 0) {
        return formattedPhone;
    }
    
    // (000) 000 00
    temp = [phone substringWithRange:NSMakeRange(0, MIN(2, [phone length]))];
    [formattedPhone appendFormat:@"-%@", temp];
    
    if ([temp length] < 2) {
        return formattedPhone;
    }
    phone = [phone substringFromIndex:2];
    if ([phone length] == 0) {
        return formattedPhone;
    }
    
    // (000) 000 00 00
    temp = [phone substringWithRange:NSMakeRange(0, MIN(2, [phone length]))];
    [formattedPhone appendFormat:@"-%@", temp];
    
    return formattedPhone;
}

+ (BOOL)isValidPhone:(NSString *)phone {
    return [[self digitizeString:phone] length] == 10;
}

@end
