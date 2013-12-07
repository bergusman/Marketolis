//
//  MRDialogCell.h
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRBadgeView.h"

// TODO: add post status (selled, deleted)
// TODO: move views into content view

@interface MRDialogCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet MRBadgeView *badgeView;

@property (assign, nonatomic) BOOL read;

+ (CGFloat)height;

@end
