//
//  MREnterConfirmViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/9/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MREnterConfirmViewController.h"

@interface MREnterConfirmViewController ()

@property (strong, nonatomic) UIBarButtonItem *doneBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *spinnerBarButtonItem;

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation MREnterConfirmViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"enter.confirm.title", @"");
    
    self.doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                           target:self
                                                                           action:@selector(doneAction:)];
    
    self.doneBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = self.doneBarButtonItem;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] init];
    spinner.color = [UIColor redColor];
    [spinner sizeToFit];
    [spinner startAnimating];
    self.spinnerBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
}

#pragma mark - Content

- (void)confirm {
    [self.navigationItem setRightBarButtonItem:self.spinnerBarButtonItem animated:YES];
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.navigationItem setRightBarButtonItem:self.doneBarButtonItem animated:YES];
    });
}

#pragma mark - Actions

- (void)doneAction:(id)sender {
    [self confirm];
}

- (IBAction)codeTextFieldEditingChanged:(id)sender {
    self.doneBarButtonItem.enabled = ([self.codeTextField.text length] > 0);
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    [self.codeTextField becomeFirstResponder];
}

@end
