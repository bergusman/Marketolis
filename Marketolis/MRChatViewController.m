//
//  MRChatViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRChatViewController.h"

#import "MRInterfaceHelper.h"

@interface MRChatViewController ()

@end

@implementation MRChatViewController

- (void)dealloc {
    
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    [MRInterfaceHelper setupLeftBarButtonItemForViewController:self];
}

@end
