//
//  MRInterfaceHelper.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/25/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRInterfaceHelper.h"

#import "MRBackButton.h"
#import "MRMenuButton.h"

#import <ViewDeck/IIViewDeckController.h>

@implementation MRInterfaceHelper

+ (void)setupLeftBarButtonItemForViewController:(UIViewController *)viewController {
    __weak typeof(viewController) wVC = viewController;
    
    if (wVC.navigationController) {
        if ([wVC.navigationController.viewControllers count] == 1) {
            MRMenuButton *menuButton = [[MRMenuButton alloc] init];
            menuButton.actionHandler = ^() {
                [wVC.viewDeckController toggleLeftView];
            };
            wVC.navigationItem.leftBarButtonItem = [menuButton barButtonItem];
        } else {
            MRBackButton *backButton = [[MRBackButton alloc] init];
            backButton.actionHandler = ^() {
                [wVC.navigationController popViewControllerAnimated:YES];
            };
            wVC.navigationItem.leftBarButtonItem = [backButton barButtonItem];
        }
    }
}

@end
