//
//  MRMenuButton.h
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRMenuButton : UIButton

@property (copy, nonatomic) void (^actionHandler)();

- (UIBarButtonItem *)barButtonItem;

@end
