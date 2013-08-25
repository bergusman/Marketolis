//
//  MRMenuItemCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMenuItemCell.h"

@interface MRMenuItemCell ()

@end

@implementation MRMenuItemCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.badgeView.text length] == 0) {
        self.badgeView.hidden = YES;
    } else {
        self.badgeView.hidden = NO;
        self.badgeView.center = CGPointMake(220, 27.5);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = MR_RGB(228, 232, 233);
    self.selectedBackgroundView = sbv;
    
    self.badgeView.cornerRadius = 7.5;
    self.badgeView.textFont = [UIFont boldSystemFontOfSize:16];
}

@end
