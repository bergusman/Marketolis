//
//  MRRightBubbleCell.m
//  Marketolis
//
//  Created by Vitaly Berg on 9/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRRightBubbleCell.h"

@interface MRRightBubbleCell ()

@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;

@end

@implementation MRRightBubbleCell

#pragma mark - Setups

- (void)setupBubbleBackground {
    UIImage *bubbleImage = [UIImage imageNamed:@"chat-bubble-incoming"];
    bubbleImage = [bubbleImage resizableImageWithCapInsets:UIEdgeInsetsMake(8, 18, 22, 10) resizingMode:UIImageResizingModeStretch];
    self.bubbleImageView.image = bubbleImage;
}

#pragma mark - Sizeing and Layouting

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect messageRect = [self.messageLabel.text boundingRectWithSize:CGSizeMake(256, CGFLOAT_MAX)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName: self.messageLabel.font}
                                                              context:nil];
    
    messageRect.size.width = ceil(messageRect.size.width);
    messageRect.size.height = ceil(messageRect.size.height);
    
    self.messageLabel.frame = CGRectMake(20, 10, messageRect.size.width, messageRect.size.height);
    
    CGFloat bubbleWidth = 20 + messageRect.size.width + 10;
    CGFloat bubbleHeight = 10 + messageRect.size.height + 10;
    
    self.bubbleView.frame = CGRectMake(10, 5, bubbleWidth, bubbleHeight);
    
    self.dateLabel.frame = CGRectMake(10, CGRectGetMaxY(self.bubbleView.frame), 200, 20);
}

+ (CGFloat)heightWithMessage:(NSString *)message {
    static NSDictionary *messageTextAttributes;
    if (!messageTextAttributes) {
        UIFont *font = [MRInterfaceHelper helveticaRegularWithSize:16];
        messageTextAttributes = @{NSFontAttributeName: font};
    }
    
    CGRect messageRect = [message boundingRectWithSize:CGSizeMake(256, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:messageTextAttributes
                                               context:nil];
    
    return 5 + (10 + ceil(messageRect.size.height) + 10) + 5 + 20 + 5;
}

#pragma mark - Nibbing

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupBubbleBackground];
}

@end
