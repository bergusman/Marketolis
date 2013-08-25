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
    self.badgeColor = MR_RGB(45, 154, 194);
    self.textColor = [UIColor whiteColor];
    self.minWidth = 27;
    self.height = 27;
    self.textPadding = 6;
    [self setText:nil];
}

#pragma mark - Property Accessors

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (void)setHeight:(CGFloat)height {
    _height = height;
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (void)setMinWidth:(CGFloat)minWidth {
    _minWidth = minWidth;
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (void)setTextPadding:(CGFloat)textPadding {
    _textPadding = textPadding;
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self setNeedsDisplay];
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    _badgeColor = badgeColor;
    [self setNeedsDisplay];
}

#pragma mark - Sizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize textSize = [self.text sizeWithFont:self.font];
    return CGSizeMake(MAX(textSize.width + self.textPadding, self.minWidth), self.height);
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:7.5];
    [self.badgeColor setFill];
    [path fill];
    
    CGRect textRect = rect;
    textRect.origin.y = (rect.size.height - self.font.lineHeight) / 2;
    
    [self.textColor setFill];
    [self.text drawInRect:textRect withFont:self.font lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
}

@end
