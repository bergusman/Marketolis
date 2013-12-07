//
//  MROfferCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/22/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPostCell.h"

@interface MRPostCell ()

@property (weak, nonatomic) IBOutlet UIView *photoDimView;

@end

@implementation MRPostCell

- (void)setupSelectedBackgroundView {
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = MR_RGB(240, 240, 240);
    self.selectedBackgroundView = sbv;
}

- (void)setupBadgeView {
    self.badgeView.textFont = [MRInterfaceHelper rubleHelveticaLightWithSize:12];
    self.badgeView.cornerRadius = 4;
}

+ (CGFloat)height {
    return 100;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupSelectedBackgroundView];
    [self setupBadgeView];
}

@end
