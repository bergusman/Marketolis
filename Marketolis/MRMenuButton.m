//
//  MRMenuButton.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMenuButton.h"

@implementation MRMenuButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *bg;
        
        bg = [UIImage imageNamed:@"navbar-button-action-passive"];
        bg = [bg stretchableImageWithLeftCapWidth:9 topCapHeight:0];
        [self setBackgroundImage:bg forState:UIControlStateNormal];
        
        bg = [UIImage imageNamed:@"navbar-button-action-active"];
        bg = [bg stretchableImageWithLeftCapWidth:9 topCapHeight:0];
        [self setBackgroundImage:bg forState:UIControlStateHighlighted];
        
        bg = [UIImage imageNamed:@"navbar-icon-menu"];
        [self setImage:bg forState:UIControlStateNormal];
        [self setImage:bg forState:UIControlStateHighlighted];
        
        [self sizeToFit];
        
        [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(40, 30);
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
