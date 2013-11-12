//
//  MRNewProfileViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewProfileViewController.h"

#import "MRProfileEditorViewController.h"

@interface MRNewProfileViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@end

@implementation MRNewProfileViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"profile.title", @"");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                           target:self
                                                                                           action:@selector(editBarButtonTouchUpInside:)];
}

#pragma mark - Actions

- (void)editBarButtonTouchUpInside:(id)sender {
    MRProfileEditorViewController *profileEditorVC = [[MRProfileEditorViewController alloc] init];
    profileEditorVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:profileEditorVC animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return NSLocalizedString(@"profile.section.notifications.title", @"");
}

#pragma mark - UITableViewDelegate

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"tab-bar-profile"];
        self.tabBarItem.title = NSLocalizedString(@"tabbar.profile", @"");
    }
    return self;
}

@end
