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

#import "MRNewMapViewController.h"
#import "MRNewPostsViewController.h"
#import "MRNewMessagesViewController.h"
#import "MRNewProfileViewController.h"
#import "MRNewCreatePostViewController.h"

#import <Crashlytics/Crashlytics.h>
#import <FlurrySDK/Flurry.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>

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
    MRNewMapViewController *mapVC = [[MRNewMapViewController alloc] init];
    UINavigationController *mapNC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    MRNewPostsViewController *favoritesVC = [[MRNewPostsViewController alloc] init];
    UINavigationController *favoritesNC = [[UINavigationController alloc] initWithRootViewController:favoritesVC];
    
    MRNewMessagesViewController *messagesVC = [[MRNewMessagesViewController alloc] init];
    UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    
    MRNewProfileViewController *profileVC = [[MRNewProfileViewController alloc] init];
    UINavigationController *profileNC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    MRNewCreatePostViewController *createOfferVC = [[MRNewCreatePostViewController alloc] init];
    UINavigationController *createOfferNC = [[UINavigationController alloc] initWithRootViewController:createOfferVC];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mapNC, favoritesNC, messagesNC, profileNC, createOfferNC];
    
    self.window.rootViewController = tabBarController;
}

- (void)registerForRemoteNotifications {
    UIRemoteNotificationType type = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert;
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:type];
}

#pragma mark - Setups

- (void)setupCrashlytics {
    [Crashlytics startWithAPIKey:@"9ca680cb0b1764352949438282f40e14139eb082"];
}

- (void)setupFlurry {
    [Flurry startSession:@"N4YXTH4T6WY8WJD8JCD7"];
}

- (void)setupGoogleAnalytics {
    [[GAI sharedInstance] trackerWithTrackingId:@""];
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
