//
//  MRInputTextBar.m
//  Marketolis
//
//  Created by Vitaly Berg on 9/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRInputTextBar.h"

@interface MRInputTextBar () <HPGrowingTextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *textFieldMaskImageView;

@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end

@implementation MRInputTextBar

#pragma mark - Setups

- (void)setupBackground {
    UIImage *bg = [UIImage imageNamed:@"chat-field-background"];
    bg = [bg resizableImageWithCapInsets:UIEdgeInsetsMake(20, 0, 20, 0) resizingMode:UIImageResizingModeStretch];
    self.backgroundImageView.image = bg;
}

- (void)setupTextFieldMask {
    UIImage *bg = [UIImage imageNamed:@"chat-field"];
    bg = [bg resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch];
    self.textFieldMaskImageView.image = bg;
}

- (void)setupTextField {
    self.growingTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(47, 5, 202, 34)];
    self.growingTextView.backgroundColor = [UIColor whiteColor];
    self.growingTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    self.growingTextView.minNumberOfLines = 1;
    self.growingTextView.maxNumberOfLines = 6;
    self.growingTextView.delegate = self;
    self.growingTextView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(1, 0, 1, -1);
    self.growingTextView.backgroundColor = [UIColor clearColor];
    
    self.growingTextView.backgroundColor = [UIColor greenColor];
    
    [self insertSubview:self.growingTextView atIndex:2];
    
    /*
    
    self.growingTextView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(10, 5, 200, 100)];
    self.growingTextView.delegate = self;
    
    self.growingTextView.placeholder = @"Текст";
    [self addSubview:self.growingTextView];
    //[self insertSubview:self.growingTextView belowSubview:self.textFieldMaskImageView];
    [self.growingTextView sizeToFit];
    
    self.growingTextView.backgroundColor = [UIColor greenColor];
    
    NSLog(@"%@", NSStringFromCGRect(self.growingTextView.frame));
     
     */
}

#pragma mark - Content

- (NSString *)placeholder {
    return self.growingTextView.placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.growingTextView.placeholder = placeholder;
}

- (NSString *)text {
    return self.growingTextView.text;
}

- (void)setText:(NSString *)text {
    self.growingTextView.text = text;
}

- (NSString *)action {
    return [self.sendButton titleForState:UIControlStateNormal];
}

- (void)setAction:(NSString *)action {
    [self.sendButton setTitle:action forState:UIControlStateNormal];
}

#pragma mark - Actions

- (IBAction)sendButtonTouchUpInside:(id)sender {
    if ([self.delegate respondsToSelector:@selector(inputTextBarDidPressSend:)]) {
        [self.delegate inputTextBarDidPressSend:self];
    }
}

#pragma mark - HPGrowingTextViewDelegate

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height {
    CGFloat diff = height - growingTextView.bounds.size.height;
    CGFloat newHeight = self.frame.size.height + diff;
    
    if ([self.delegate respondsToSelector:@selector(inputTextBar:willChangeHeight:)]) {
        [self.delegate inputTextBar:self willChangeHeight:newHeight];
    }
    
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

- (void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView {
    NSString *text = growingTextView.text;
    
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.sendButton.enabled = [text length] > 0;
}

#pragma mark - Awake From Nib

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupBackground];
    [self setupTextField];
    [self setupTextFieldMask];
    
    //self.growingTextView.text = @"234";
}

#pragma mark - Nibbing

+ (MRInputTextBar *)inputTextBarFromNib {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRInputTextBar class]) bundle:[NSBundle mainBundle]];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    return [views firstObject];
}

@end
