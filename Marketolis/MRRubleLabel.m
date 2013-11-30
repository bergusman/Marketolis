//
//  MRRubleLabel.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/30/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRRubleLabel.h"

@implementation MRRubleLabel

- (void)setFont:(UIFont *)font {
    NSString *fontName = font.fontName;
    fontName = [fontName stringByReplacingOccurrencesOfString:@"HelveticaNeue" withString:@"RocketBank"];
    
    font = [UIFont fontWithName:fontName size:font.pointSize];
    [super setFont:font];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = self.font;
}

@end
