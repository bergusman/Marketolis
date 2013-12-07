//
//  MRLeftBubbleCell.h
//  Marketolis
//
//  Created by Vitaly Berg on 9/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRLeftBubbleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

+ (CGFloat)heightWithMessage:(NSString *)message;

@end
