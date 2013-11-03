//
//  MRNewMapViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewMapViewController.h"

#import <MapKit/MapKit.h>

@interface MRNewMapViewController () <
    MKMapViewDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UIImageView *filterBackgroundImageView;
@property (weak, nonatomic) IBOutlet UITextField *filterTextField;

@end

@implementation MRNewMapViewController

#pragma mark - UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.map", @"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
