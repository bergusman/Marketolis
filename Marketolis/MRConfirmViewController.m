//
//  MRConfirmViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRConfirmViewController.h"

@interface MRConfirmViewController ()

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation MRConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    
    [self.codeTextField becomeFirstResponder];
}

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = @"Подтверждение";
}

@end
