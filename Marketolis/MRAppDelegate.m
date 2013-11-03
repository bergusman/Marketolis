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

////////////////////////////////////////////

#import "MRNewMapViewController.h"
#import "MRNewOffersViewController.h"
#import "MRNewMessagesViewController.h"
#import "MRNewProfileViewController.h"
#import "MRNewCreateOfferViewController.h"

@interface MRAppDelegate () <IIViewDeckControllerDelegate>

@end

@implementation MRAppDelegate

#pragma mark - Welcome

- (void)showWelcome {
    MRWelcomeViewController *welcomeVc = [[MRWelcomeViewController alloc] init];
    [self.window.rootViewController presentViewController:welcomeVc animated:NO completion:nil];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Crashlytics startWithAPIKey:@"9ca680cb0b1764352949438282f40e14139eb082"];
    
    MRNewMapViewController *mapVC = [[MRNewMapViewController alloc] init];
    UINavigationController *mapNC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    MRNewOffersViewController *favoritesVC = [[MRNewOffersViewController alloc] init];
    UINavigationController *favoritesNC = [[UINavigationController alloc] initWithRootViewController:favoritesVC];
    
    MRNewMessagesViewController *messagesVC = [[MRNewMessagesViewController alloc] init];
    UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    
    MRNewProfileViewController *profileVC = [[MRNewProfileViewController alloc] init];
    UINavigationController *profileNC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    MRNewCreateOfferViewController *createOfferVC = [[MRNewCreateOfferViewController alloc] init];
    UINavigationController *createOfferNC = [[UINavigationController alloc] initWithRootViewController:createOfferVC];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mapNC, favoritesNC, messagesNC, profileNC, createOfferNC];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [UIColor redColor];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    ////////////////////
    
    /*
    [self setupAppearance];
    
    MRMenuViewController *menuVc = [[MRMenuViewController alloc] init];
    MRMapViewController *mapVc = [[MRMapViewController alloc] init];
    
    UINavigationController *mapNc = [[UINavigationController alloc] initWithRootViewController:mapVc];
    
    IIViewDeckController *viewDeckController = [[IIViewDeckController alloc] init];
    viewDeckController.delegate = self;
    viewDeckController.centerController = mapNc;
    viewDeckController.leftController = menuVc;
    
    viewDeckController.leftSize = 70;
    viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewDeckController;
    [self.window makeKeyAndVisible];
    
    [self showWelcome];
    */
    
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
    UIImage *bg;
    
    // Navigation Bar
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
    
    // Navigation Bar Button Item
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    barButtonItem.tintColor = [UIColor redColor];
    
    bg = [UIImage imageNamed:@"navbar-button-back-passive"];
    //bg = [bg stretchableImageWithLeftCapWidth:18 topCapHeight:0];
    [barButtonItem setBackButtonBackgroundImage:bg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    bg = [UIImage imageNamed:@"navbar-button-back-active"];
    //bg = [bg stretchableImageWithLeftCapWidth:18 topCapHeight:0];
    [barButtonItem setBackButtonBackgroundImage:bg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    bg = [UIImage imageNamed:@"navbar-button-action-passive"];
    //bg = [bg stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    [barButtonItem setBackgroundImage:bg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    bg = [UIImage imageNamed:@"navbar-button-action-active"];
    //bg = [bg stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    [barButtonItem setBackgroundImage:bg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

@end
