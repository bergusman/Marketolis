//
//  MRWelcomeViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRWelcomeViewController.h"

#import "MRSignUpViewController.h"
#import "MRConfirmViewController.h"

@interface MRWelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *enterButton;

@end

@implementation MRWelcomeViewController

#pragma mark - Setups

- (void)setupEnterButton {
    [self.enterButton setTitle:NSLocalizedString(@"welcome.enter", @"") forState:UIControlStateNormal];
}

#pragma mark - Content

- (void)signUpDidConfirm:(NSNotification *)notification {
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - Actions

- (IBAction)enterButtonTouchUpInside:(id)sender {
    MRSignUpViewController *signUpVc = [[MRSignUpViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:signUpVc];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupEnterButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(signUpDidConfirm:)
                                                 name:MRSignUpConfirmedNotification
                                               object:nil];
}

@end
