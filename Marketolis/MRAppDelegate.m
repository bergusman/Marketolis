//
//  MRAppDelegate.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRAppDelegate.h"

#import "MRWelcomeViewController.h"
#import "MRSignUpViewController.h"
#import "MRConfirmViewController.h"

#import "MRMapViewController.h"
#import "MRPostsViewController.h"
#import "MRMessagesViewController.h"
#import "MRProfileViewController.h"
#import "MRCreatePostViewController.h"

#import <Crashlytics/Crashlytics.h>
#import <FlurrySDK/Flurry.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>

#import "MRPostViewController.h"

@interface MRAppDelegate ()

@end

@implementation MRAppDelegate

#pragma mark - Content

- (void)showWelcome {
    MRWelcomeViewController *welcomeVC = [[MRWelcomeViewController alloc] init];
    self.window.rootViewController = welcomeVC;
    //[self.window.rootViewController presentViewController:welcomeVC animated:NO completion:nil];
}

- (void)showApp {
    MRMapViewController *mapVC = [[MRMapViewController alloc] init];
    UINavigationController *mapNC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    MRPostsViewController *favoritesVC = [[MRPostsViewController alloc] init];
    UINavigationController *favoritesNC = [[UINavigationController alloc] initWithRootViewController:favoritesVC];
    
    MRMessagesViewController *messagesVC = [[MRMessagesViewController alloc] init];
    UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    
    MRProfileViewController *profileVC = [[MRProfileViewController alloc] init];
    UINavigationController *profileNC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    MRCreatePostViewController *createOfferVC = [[MRCreatePostViewController alloc] init];
    UINavigationController *createOfferNC = [[UINavigationController alloc] initWithRootViewController:createOfferVC];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mapNC, favoritesNC, messagesNC, profileNC, createOfferNC];
    
    self.window.rootViewController = tabBarController;
}

- (void)registerForRemoteNotifications {
    UIRemoteNotificationType type = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert;
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:type];
}

- (void)showTestPost {
    MRPostViewController *postVC = [[MRPostViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:postVC];
    self.window.rootViewController = nc;
}

#pragma mark - Setups

- (void)setupCrashlytics {
    [Crashlytics startWithAPIKey:@"9ca680cb0b1764352949438282f40e14139eb082"];
}

- (void)setupFlurry {
    [Flurry startSession:@"N4YXTH4T6WY8WJD8JCD7"];
}

- (void)setupGoogleAnalytics {
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-45821710-1"];
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupCrashlytics];
    [self setupFlurry];
    [self setupGoogleAnalytics];
    [self setupWindow];
    //[self showWelcome];
    [self showApp];
    //[self showTestPost];
    [self registerForRemoteNotifications];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken  {
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
}

@end
