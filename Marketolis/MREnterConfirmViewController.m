//
//  MREnterConfirmViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12/9/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MREnterConfirmViewController.h"

#import "MREnterNameViewController.h"

@interface MREnterConfirmViewController ()

@property (strong, nonatomic) UIBarButtonItem *doneBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *spinnerBarButtonItem;

@property (weak, nonatomic) IBOutlet UILabel *codeTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UIButton *resendButton;

@property (strong, nonatomic) NSTimer *resendTimer;

@property (strong, nonatomic) NSOperation *operation;

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
    [spinner sizeToFit];
    [spinner startAnimating];
    self.spinnerBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
}

- (void)setupLocalizedText {
    self.codeTitleLabel.text = NSLocalizedString(@"enter.confirm.code.title", @"");
    self.detailsLabel.text = NSLocalizedString(@"enter.confirm.details", @"");
    [self.resendButton setTitle:NSLocalizedString(@"enter.confirm.resend.button", @"") forState:UIControlStateNormal];
}

- (void)setupDetailsAndResend {
    if (MR_IS_IPHONE_5) {
        MR_SET_FRAME_Y(self.detailsLabel, 220);
        MR_SET_FRAME_Y(self.resendButton, 240);
    } else {
        MR_SET_FRAME_Y(self.detailsLabel, 145);
        MR_SET_FRAME_Y(self.resendButton, 190);
    }
}

#pragma mark - Content

- (void)confirm {
    [self.navigationItem setRightBarButtonItem:self.spinnerBarButtonItem animated:YES];
    self.operation = [[MRMarketolisManager sharedManager] confirmByCode:self.codeTextField.text callback:^(id result, NSError *error) {
        [self.navigationItem setRightBarButtonItem:self.doneBarButtonItem animated:YES];
        
        if (error) {
            // TODO: parse and show error
        } else {
            if ([MRMarketolisManager sharedManager].state == MRMarketolisManagerStateWork) {
                [[MRAppDelegate sharedDelegate] showApp];
            }
            else if ([MRMarketolisManager sharedManager].state == MRMarketolisManagerStateIncomplete) {
                MREnterNameViewController *nameVC = [[MREnterNameViewController alloc] init];
                UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:nameVC];
                [self presentViewController:nc animated:YES completion:nil];
            }
            else {
                // TODO: show error
            }
        }
    }];
}

- (void)startResendTimer {
    self.resendButton.enabled = NO;
    self.resendTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(resendTimerAction:) userInfo:nil repeats:NO];
}

- (void)resendTimerAction:(id)sender {
    self.resendButton.enabled = YES;
}

#pragma mark - Actions

- (void)doneAction:(id)sender {
    [self confirm];
}

- (IBAction)codeTextFieldEditingChanged:(id)sender {
    self.doneBarButtonItem.enabled = ([self.codeTextField.text length] > 0);
}

- (IBAction)resendButtonTouchUpInside:(id)sender {
    [[MRMarketolisManager sharedManager] resendCodeCallback:^(id result, NSError *error) {
    }];
    
    double delayInSeconds = 0.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self startResendTimer];
    });
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupLocalizedText];
    [self setupDetailsAndResend];
    
    [self startResendTimer];
    
    [self.codeTextField becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.operation cancel];
}

#pragma mark - NSObject

- (void)dealloc {
    [self.resendTimer invalidate];
}

@end
