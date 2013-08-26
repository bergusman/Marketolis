//
//  MRConfirmViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRConfirmViewController.h"

#import "MRInterfaceHelper.h"

NSString * const MRSignUpConfirmedNotification = @"MRSignUpConfirmedNotification";

@interface MRConfirmViewController ()

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation MRConfirmViewController

#pragma mark - UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (MR_IS_IPHONE_5) {
        self = [super initWithNibName:@"MRConfirmViewController~568h" bundle:nibBundleOrNil];
    } else {
        self = [super initWithNibName:@"MRConfirmViewController" bundle:nibBundleOrNil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    
    [self.codeTextField becomeFirstResponder];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"confirm.title", @"");
    [MRInterfaceHelper setupLeftBarButtonItemForViewController:self];
}

#pragma mark - Actions

- (IBAction)confirmButtonTouchUpInside:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
