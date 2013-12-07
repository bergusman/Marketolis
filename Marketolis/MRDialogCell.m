//
//  MRDialogCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRDialogCell.h"

@implementation MRDialogCell

- (void)setupBackgroundViews {
    self.backgroundView = [[UIView alloc] init];
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = MR_RGB(228, 232, 233);
    self.selectedBackgroundView = sbv;
}

- (void)setupBadgeView {
    self.badgeView.textFont = [MRInterfaceHelper rubleHelveticaLightWithSize:12];
    self.badgeView.cornerRadius = 4;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setRead:(BOOL)read {
    _read = read;
    if (read) {
        self.backgroundView.backgroundColor = MR_RGB(250, 250, 250);
    } else {
        self.backgroundView.backgroundColor = MR_RGB(249, 240, 215);
    }
}

+ (CGFloat)height {
    return 100;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupBackgroundViews];
    [self setupBadgeView];
    
    [self setRead:YES];
}

@end
