//
//  MRListViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/21/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MROffersViewController.h"

#import "MRInterfaceHelper.h"

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
    [MRInterfaceHelper setupLeftBarButtonItemForViewController:self];
}

@end
