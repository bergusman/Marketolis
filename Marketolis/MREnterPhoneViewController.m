//
//  MREnterPhoneViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/9/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MREnterPhoneViewController.h"

#import "MREnterConfirmViewController.h"

#import "MRPhoneHelper.h"

@interface MREnterPhoneViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIBarButtonItem *nextBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *spinnerBarButtonItem;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (strong ,nonatomic) NSOperation *loginOperation;

@end

@implementation MREnterPhoneViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"enter.phone.title", @"");
    
    self.nextBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"enter.next", @"")
                                                              style:UIBarButtonItemStyleDone
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

- (int64_t)phone {
    NSString *phone = self.phoneTextField.text;
    phone = [NSString stringWithFormat:@"7%@", phone];
    return [phone longLongValue];
}

- (void)sendPhone {
    [self.navigationItem setRightBarButtonItem:self.spinnerBarButtonItem animated:YES];
    
    self.loginOperation = [[MRMarketolisManager sharedManager] loginByPhoneNumber:[self phone] callback:^(id result, NSError *error) {
        [self.navigationItem setRightBarButtonItem:self.nextBarButtonItem animated:YES];
        if (error) {
            // TODO: parse and show error
        } else {
            [self showConfirmation];
        }
    }];
}

- (void)showConfirmation {
    MREnterConfirmViewController *confirmVC = [[MREnterConfirmViewController alloc] init];
    [self.navigationController pushViewController:confirmVC animated:YES];
}

- (void)tryShowNext {
    self.nextBarButtonItem.enabled = [MRPhoneHelper isValidPhone:self.phoneTextField.text];
}

#pragma mark - Actions

- (void)nextAction:(id)sender {
    [self sendPhone];
}

- (void)cancelAction:(id)sender {
    [self.loginOperation cancel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendPhone];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string length] > 0) {
        string = [MRPhoneHelper digitizeString:string];
        if ([string length] == 0) {
            [self tryShowNext];
            return NO;
        }
    }
    
    NSString *text = textField.text;
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [MRPhoneHelper formattedPhone:text];
    
    textField.text = text;
    
    [self tryShowNext];
    return NO;
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
