//
//  MRProfileNotificationCell.h
//  Marketolis
//
//  Created by Vitaly Berg on 11/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO: add status localization

@interface MRProfileNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

+ (CGFloat)height;

@end
