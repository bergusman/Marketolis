//
//  MRAppDelegate.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRAppDelegate.h"

#import "MRMenuViewController.h"
#import "MRMapViewController.h"

#import "MRWelcomeViewController.h"
#import "MRSignUpViewController.h"
#import "MRConfirmViewController.h"

#import <ViewDeck/IIViewDeckController.h>
#import <Crashlytics/Crashlytics.h>
#import <QuartzCore/QuartzCore.h>

@interface MRAppDelegate () <IIViewDeckControllerDelegate>

@end

@implementation MRAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Crashlytics startWithAPIKey:@"9ca680cb0b1764352949438282f40e14139eb082"];
    
    MRMenuViewController *menuVc = [[MRMenuViewController alloc] init];
    MRMapViewController *mapVc = [[MRMapViewController alloc] init];
    
    IIViewDeckController *viewDeckController = [[IIViewDeckController alloc] init];
    viewDeckController.delegate = self;
    viewDeckController.centerController = mapVc;
    viewDeckController.leftController = menuVc;
    
    viewDeckController.leftSize = 70;
    viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewDeckController;
    [self.window makeKeyAndVisible];
    
    //MRWelcomeViewController *welcomeVc = [[MRWelcomeViewController alloc] init];
    //[self.window.rootViewController presentViewController:welcomeVc animated:YES completion:nil];
    
    /*
    MRSignUpViewController *signUpVc = [[MRSignUpViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:signUpVc];
    [self.window.rootViewController presentViewController:nc animated:YES completion:nil];
    */
    
    [self setupAppearance];
    
    return YES;
}

#pragma mark - IIViewDeckControllerDelegate

- (void)viewDeckController:(IIViewDeckController*)viewDeckController applyShadow:(CALayer*)shadowLayer withBounds:(CGRect)rect {
    shadowLayer.shadowColor = [UIColor redColor].CGColor;
    shadowLayer.shadowOpacity = 0.8;
    shadowLayer.shadowOffset = CGSizeMake(-1, 0);
    shadowLayer.shadowRadius = 10;
    shadowLayer.shadowPath = [UIBezierPath bezierPathWithRect:rect].CGPath;
    NSLog(@"%@", shadowLayer);
}

#pragma mark - Appearance

- (void)setupAppearance {
    [self setupNavigationBarAppearance];
}

- (void)setupNavigationBarAppearance {
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    navBar.tintColor = [UIColor redColor];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"register-header-background"]
                 forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *navBarTitleAttrs = @{
        UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
        UITextAttributeTextColor: [UIColor whiteColor],
        UITextAttributeTextShadowColor: [UIColor clearColor],
        UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
    };
    
    [navBar setTitleTextAttributes:navBarTitleAttrs];
}

@end
