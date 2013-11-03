//
//  MRNewMessagesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewMessagesViewController.h"

@interface MRNewMessagesViewController ()

@end

@implementation MRNewMessagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.messages", @"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
