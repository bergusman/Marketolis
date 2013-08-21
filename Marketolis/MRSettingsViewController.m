//
//  MRSettingsViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/21/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRSettingsViewController.h"

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
}

@end
