//
//  MRInputTextBar.h
//  Marketolis
//
//  Created by Vitaly Berg on 9/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <HPGrowingTextView/HPGrowingTextView.h>


@protocol MRInputTextBarDelegate;


@interface MRInputTextBar : UIView

@property (assign, nonatomic) id<MRInputTextBarDelegate> delegate;

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *placeholder;
@property (strong, nonatomic) NSString *action;

@property (strong, nonatomic) HPGrowingTextView *growingTextView;

+ (MRInputTextBar *)inputTextBarFromNib;

@end


@protocol MRInputTextBarDelegate <NSObject>

@optional
- (void)inputTextBar:(MRInputTextBar *)inputTextBar willChangeHeight:(CGFloat)height;
- (void)inputTextBarDidPressSend:(MRInputTextBar *)inputTextBar;

@end
