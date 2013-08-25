//
//  MRBadgeView.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRBadgeView.h"

@interface MRBadgeView ()

@property (strong, nonatomic) UIFont *font;

@end

@implementation MRBadgeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.font = [UIFont boldSystemFontOfSize:16];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize textSize = [self.text sizeWithFont:self.font];
    return CGSizeMake(MAX(textSize.width + 6, 27), 27);
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:7.5];
    [MR_RGB(45, 154, 194) setFill];
    [path fill];
    
    CGRect textRect = rect;
    textRect.origin.y += 3.5;
    
    [[UIColor whiteColor] setFill];
    [self.text drawInRect:textRect withFont:self.font lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}

@end
