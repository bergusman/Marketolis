//
//  MRSettingsViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/21/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRSettingsViewController.h"

#import "MRMenuButton.h"

#import <ViewDeck/IIViewDeckController.h>

@interface MRSettingsViewController ()

@end

@implementation MRSettingsViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"settings.title", @"");
    
    if ([self.navigationController.viewControllers count] == 1) {
        MRMenuButton *menuButton = [[MRMenuButton alloc] init];
        menuButton.actionHandler = ^() {
            [self.viewDeckController toggleLeftView];
        };
        self.navigationItem.leftBarButtonItem = [menuButton barButtonItem];
    }
}

@end
