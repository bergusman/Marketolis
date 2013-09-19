//
//  MRInputTextBar.m
//  Marketolis
//
//  Created by Vitaly Berg on 9/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRInputTextBar.h"

@interface MRInputTextBar ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *textFieldMaskImageView;

@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation MRInputTextBar

#pragma mark - Setups

- (void)setupBackground {
    UIImage *bg = [UIImage imageNamed:@"chat-field-background"];
    bg = [bg stretchableImageWithLeftCapWidth:5 topCapHeight:28];
    self.backgroundImageView.image = bg;
}

- (void)setupSendButton {
    UIImage *bg = [UIImage imageNamed:@"chat-button-send-passive"];
    bg = [bg stretchableImageWithLeftCapWidth:8 topCapHeight:0];
    [self.sendButton setBackgroundImage:bg forState:UIControlStateNormal];
    
    bg = [UIImage imageNamed:@"chat-button-send-active"];
    bg = [bg stretchableImageWithLeftCapWidth:8 topCapHeight:0];
    [self.sendButton setBackgroundImage:bg forState:UIControlStateHighlighted];
}

- (void)setupTextFieldMask {
    UIImage *bg = [UIImage imageNamed:@"chat-field"];
    bg = [bg stretchableImageWithLeftCapWidth:20 topCapHeight:28];
    self.textFieldMaskImageView.image = bg;
}

- (void)setupTextField {
    
}

#pragma mark - Content

- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
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
    
    self.placeholderLabel.hidden = [text length] > 0;
    
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.sendButton.enabled = [text length] > 0;
}

#pragma mark - Awake From Nib

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupBackground];
    [self setupTextField];
    [self setupTextFieldMask];
    [self setupSendButton];
    
    self.growingTextView.text = nil;
}

#pragma mark - Nibbing

+ (MRInputTextBar *)inputTextBarFromNib {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRInputTextBar class]) bundle:[NSBundle mainBundle]];
    NSArray *views = [nib instantiateWithOwner:nil options:nil];
    return views[0];
}

@end
