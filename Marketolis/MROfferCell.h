//
//  MROfferCell.h
//  Marketolis
//
//  Created by Vitaly Berg on 8/22/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRBadgeView.h"

@interface MROfferCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet MRBadgeView *badgeView;

+ (CGFloat)height;

@end
