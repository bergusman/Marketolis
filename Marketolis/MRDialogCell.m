//
//  MRDialogCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRDialogCell.h"

@implementation MRDialogCell

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

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
    NSLog(@"%@", self.backgroundView);
    NSLog(@"%@", self.backgroundColor);
}

- (void)setRead:(BOOL)read {
    NSLog(@"%@", self.backgroundView);
    _read = read;
    if (read) {
        self.backgroundView.backgroundColor = MR_RGB(250, 250, 250);
    } else {
        self.backgroundView.backgroundColor = MR_RGB(249, 240, 215);
    }
}

+ (CGFloat)height {
    return 82;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIView alloc] init];
    UIView *sbv = [[UIView alloc] init];
    sbv.backgroundColor = MR_RGB(228, 232, 233);
    self.selectedBackgroundView = sbv;
    [self setRead:YES];
}

@end
