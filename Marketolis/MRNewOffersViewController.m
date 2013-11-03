//
//  MRNewFavoritesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewOffersViewController.h"

@interface MRNewOffersViewController ()

@end

@implementation MRNewOffersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.favorites", @"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
