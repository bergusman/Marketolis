//
//  MRSignUpViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRSignUpViewController.h"

#import "MRConfirmViewController.h"

@interface MRSignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation MRSignUpViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    
    [self.nameTextField becomeFirstResponder];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"signup.title", @"");
}

#pragma mark - Actions

- (IBAction)nextButtonTouchUpInside:(id)sender {
    MRConfirmViewController *confirmVc = [[MRConfirmViewController alloc] init];
    [self.navigationController pushViewController:confirmVc animated:YES];
}

@end
