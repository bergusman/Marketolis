//
//  MRWelcomeViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRWelcomeViewController.h"

#import "MREnterPhoneViewController.h"

@interface MRWelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *enterButton;

@end

@implementation MRWelcomeViewController

#pragma mark - Setups

- (void)setupEnterButton {
    [self.enterButton setTitle:NSLocalizedString(@"welcome.enter", @"") forState:UIControlStateNormal];
}

#pragma mark - Content

- (void)showPhoneEntering {
    MREnterPhoneViewController *phoneVC = [[MREnterPhoneViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:phoneVC];
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)enterButtonTouchUpInside:(id)sender {
    [self showPhoneEntering];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEnterButton];
}

@end
