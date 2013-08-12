//
//  MRMenuItemCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMenuItemCell.h"

@interface MRMenuItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *badgeBubbleImageView;

@end

@implementation MRMenuItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = [UIColor colorWithRed:228/255.f green:232/255.f blue:233/255.f alpha:1];
    
    self.selectedBackgroundView = sbv;
}

@end
