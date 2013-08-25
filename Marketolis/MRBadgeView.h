//
//  MRBadgeView.h
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRBadgeView : UIView

@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat minWidth;
@property (assign, nonatomic) CGFloat textPadding;
@property (assign, nonatomic) CGFloat cornerRadius;

@property (strong, nonatomic) UIColor *badgeColor;
@property (strong, nonatomic) UIColor *textColor;

@property (strong, nonatomic) UIFont *textFont;

@property (copy, nonatomic) NSString *text;

@end
