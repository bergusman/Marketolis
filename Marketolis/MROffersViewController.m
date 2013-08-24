//
//  MRListViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/21/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MROffersViewController.h"

#import "MRMenuButton.h"

#import <ViewDeck/IIViewDeckController.h>

@interface MROffersViewController ()

@end

@implementation MROffersViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    if ([self.navigationController.viewControllers count] == 1) {
        MRMenuButton *menuButton = [[MRMenuButton alloc] init];
        menuButton.actionHandler = ^() {
            [self.viewDeckController toggleLeftView];
        };
        self.navigationItem.leftBarButtonItem = [menuButton barButtonItem];
    }
}

@end
