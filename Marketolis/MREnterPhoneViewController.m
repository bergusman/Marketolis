//
//  MREnterPhoneViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/9/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MREnterPhoneViewController.h"

#import "MREnterConfirmViewController.h"

@interface MREnterPhoneViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIBarButtonItem *nextBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *spinnerBarButtonItem;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation MREnterPhoneViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"enter.phone.title", @"");
    
    self.nextBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"enter.next", @"")
                                                              style:UIBarButtonItemStyleBordered
                                                             target:self
                                                             action:@selector(nextAction:)];
    
    self.nextBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = self.nextBarButtonItem;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(cancelAction:)];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] init];
    [spinner sizeToFit];
    [spinner startAnimating];
    self.spinnerBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
}

#pragma mark - Content

- (void)sendPhone {
    [self.navigationItem setRightBarButtonItem:self.spinnerBarButtonItem animated:YES];
    
    [[MRMarketolisManager sharedManager]  loginByPhoneNumber:0 callback:^(id result, NSError *error) {
        [self.navigationItem setRightBarButtonItem:self.nextBarButtonItem animated:YES];
        [self showConfirmation];
    }];
}

- (void)showConfirmation {
    MREnterConfirmViewController *confirmVC = [[MREnterConfirmViewController alloc] init];
    [self.navigationController pushViewController:confirmVC animated:YES];
}

#pragma mark - Actions

- (void)nextAction:(id)sender {
    [self sendPhone];
}

- (void)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)phoneTextFieldEditingChanged:(id)sender {
    self.nextBarButtonItem.enabled = ([self.phoneTextField.text length] > 0);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendPhone];
    return YES;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.phoneTextField becomeFirstResponder];
}

@end
