//
//  MRBackButton.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRBackButton.h"

@implementation MRBackButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *bg;
        
        bg = [UIImage imageNamed:@"navbar-button-back-passive"];
        bg = [bg stretchableImageWithLeftCapWidth:18 topCapHeight:0];
        [self setBackgroundImage:bg forState:UIControlStateNormal];
        
        bg = [UIImage imageNamed:@"navbar-button-back-active"];
        bg = [bg stretchableImageWithLeftCapWidth:18 topCapHeight:0];
        [self setBackgroundImage:bg forState:UIControlStateHighlighted];
        
        bg = [UIImage imageNamed:@"navbar-icon-back"];
        [self setImage:bg forState:UIControlStateNormal];
        [self setImage:bg forState:UIControlStateHighlighted];
        
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
        
        [self sizeToFit];
        
        [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(38, 30);
}

- (void)touchUpInside:(id)sender {
    if (self.actionHandler) {
        self.actionHandler();
    }
}

- (UIBarButtonItem *)barButtonItem {
    return [[UIBarButtonItem alloc] initWithCustomView:self];
}

@end
