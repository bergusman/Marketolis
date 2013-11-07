//
//  MRNewProfileViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewProfileViewController.h"

@interface MRNewProfileViewController ()

@end

@implementation MRNewProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"tab-bar-profile"];
        self.tabBarItem.title = NSLocalizedString(@"tabbar.profile", @"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
