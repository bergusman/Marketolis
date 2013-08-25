//
//  MROfferCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/22/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MROfferCell.h"

@implementation MROfferCell

+ (CGFloat)height {
    return 82;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = MR_RGB(228, 232, 233);
    self.selectedBackgroundView = sbv;
}

@end
