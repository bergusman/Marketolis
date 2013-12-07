//
//  MRInterfaceHelper.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRInterfaceHelper.h"

@implementation MRInterfaceHelper

#pragma mark - HelveticaNeue

+ (UIFont *)helveticaBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont *)helveticaLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont *)helveticaMediumWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

+ (UIFont *)helveticaRegularWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)helveticaUltraLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:size];
}

#pragma mark - Ruble HelveticaNeue

+ (UIFont *)rubleHelveticaLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"RocketBank-Light" size:size];
}

+ (UIFont *)rubleHelveticaMediumWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"RocketBank-Medium" size:size];
}

+ (UIFont *)rubleHelveticaRegularWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"RocketBank" size:size];
}

+ (UIFont *)rubleHelveticaUltraLightWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"RocketBank-UltraLight" size:size];
    
}

@end
