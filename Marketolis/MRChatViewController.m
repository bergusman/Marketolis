//
//  MRChatViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRChatViewController.h"

#import "MRMenuButton.h"
#import "MRBackButton.h"

#import <ViewDeck/IIViewDeckController.h>

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
    __weak typeof(self) wself = self;
    
    if ([self.navigationController.viewControllers count] == 1) {
        MRMenuButton *menuButton = [[MRMenuButton alloc] init];
        menuButton.actionHandler = ^() {
            [wself.viewDeckController toggleLeftView];
        };
        self.navigationItem.leftBarButtonItem = [menuButton barButtonItem];
    } else {
        MRBackButton *backButton = [[MRBackButton alloc] init];
        backButton.actionHandler = ^() {
            [wself.navigationController popViewControllerAnimated:YES];
        };
        self.navigationItem.leftBarButtonItem = [backButton barButtonItem];
    }
}

@end
