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

#import <ViewDeck/IIViewDeckController.h>
#import <Crashlytics/Crashlytics.h>

@implementation MRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Crashlytics startWithAPIKey:@"9ca680cb0b1764352949438282f40e14139eb082"];
    
    MRMenuViewController *menuVc = [[MRMenuViewController alloc] init];
    MRMapViewController *mapVc = [[MRMapViewController alloc] init];
    
    IIViewDeckController *viewDeckController = [[IIViewDeckController alloc] init];
    viewDeckController.centerController = mapVc;
    viewDeckController.leftController = menuVc;
    
    viewDeckController.leftSize = 70;
    viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractive;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewDeckController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
