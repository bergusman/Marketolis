//
//  MRInterfaceHelper.h
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRInterfaceHelper : NSObject

// HelveticaNeue
+ (UIFont *)helveticaBoldWithSize:(CGFloat)size;
+ (UIFont *)helveticaLightWithSize:(CGFloat)size;
+ (UIFont *)helveticaMediumWithSize:(CGFloat)size;
+ (UIFont *)helveticaRegularWithSize:(CGFloat)size;
+ (UIFont *)helveticaUltraLightWithSize:(CGFloat)size;

// HelveticaNeue with Ruble Sign (replase 'ђ')
+ (UIFont *)rubleHelveticaLightWithSize:(CGFloat)size;
+ (UIFont *)rubleHelveticaMediumWithSize:(CGFloat)size;
+ (UIFont *)rubleHelveticaRegularWithSize:(CGFloat)size;
+ (UIFont *)rubleHelveticaUltraLightWithSize:(CGFloat)size;

@end
