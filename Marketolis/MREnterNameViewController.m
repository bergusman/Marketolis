//
//  MREnterNameViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/9/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MREnterNameViewController.h"

@interface MREnterNameViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIBarButtonItem *doneBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *spinnerBarButtonItem;

@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation MREnterNameViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"enter.name.title", @"");
    
    self.doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                           target:self
                                                                           action:@selector(doneAction:)];
    
    self.doneBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = self.doneBarButtonItem;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] init];
    [spinner sizeToFit];
    [spinner startAnimating];
    self.spinnerBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
}

- (void)setupLocalizedText {
    self.nameTitleLabel.text = NSLocalizedString(@"enter.name.name.title", @"");
}

#pragma mark - Content

- (void)saveName {
    [self.navigationItem setRightBarButtonItem:self.spinnerBarButtonItem animated:YES];
    
    [[MRMarketolisManager sharedManager] completeWithName:self.nameTextField.text callback:^(id result, NSError *error) {
        [self.navigationItem setRightBarButtonItem:self.doneBarButtonItem animated:YES];
       
        if (error) {
            // TODO: parse and show error
        } else {
            if ([MRMarketolisManager sharedManager].state == MRMarketolisManagerStateWork) {
                [[MRAppDelegate sharedDelegate].window.rootViewController dismissViewControllerAnimated:YES completion:nil];
                [[MRAppDelegate sharedDelegate] showApp];
            }
            else {
                // TODO: show error
            }
        }
    }];
}

#pragma mark - Actions

- (void)doneAction:(id)sender {
    [self saveName];
}

- (IBAction)nameTextFieldEditingChanged:(id)sender {
    self.doneBarButtonItem.enabled = ([self.nameTextField.text length] > 0);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self saveName];
    return YES;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupLocalizedText];
    
    [self.nameTextField becomeFirstResponder];
}

@end
