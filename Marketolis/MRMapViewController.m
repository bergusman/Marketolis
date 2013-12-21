//
//  MRNewMapViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMapViewController.h"

#import "MRPostViewController.h"

#import "MRPointAnnotation.h"
#import "MRPostAnnotationView.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import <MapKit/MapKit.h>

#define TO_USER_LOCATION_RADIUS 1000

@interface MRMapViewController () <
    MKMapViewDelegate,
    UISearchBarDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MRMapViewController

#pragma mark - Setups

- (void)setupFilterView {
    self.navigationItem.titleView = self.searchBar;
}

- (void)setupTestAnnotations {
    
    /*
    MRPointAnnotation *pointAnnotation = [[MRPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(45, 52);
    [self.mapView addAnnotation:pointAnnotation];
     */
    
    
    MRPageQuery *page = [[MRPageQuery alloc] init];
    page.limit = 10;
    page.offset = 0;
    
    [[[MRMarketolisManager sharedManager] search] queryQ:@"п" page:page callback:^(id result, NSError *error) {
        NSLog(@"%@ %@", result, error);
    }];
    
}

#pragma mark - Actions

- (IBAction)toUserLocationButtonTouchUpInside:(id)sender {
    CLLocationCoordinate2D userCoordinate = self.mapView.userLocation.coordinate;
    
    if (!(fabs((double)userCoordinate.latitude) < DBL_EPSILON && fabs((double)userCoordinate.longitude) < DBL_EPSILON)) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userCoordinate, TO_USER_LOCATION_RADIUS, TO_USER_LOCATION_RADIUS);
        [self.mapView setRegion:region animated:YES];
    }
}

- (IBAction)zoomOutButtonTouchUpInside:(id)sender {
}

- (IBAction)tap:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *annotationId = @"PostAnnotation";
    MRPostAnnotationView *annotationView = (MRPostAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationId];
    if (!annotationView) {
        annotationView = [[MRPostAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationId];
        [annotationView sizeToFit];
    }
    
    [annotationView.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    annotationView.priceLabel.text = @"23 000 ђ";
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view.annotation isKindOfClass:[MKUserLocation class]]) {
        return;
    }
    
    [mapView deselectAnnotation:view.annotation animated:YES];
    
    if ([view.annotation isKindOfClass:[MRPointAnnotation class]]) {
        MRPostViewController *postVC = [[MRPostViewController alloc] init];
        [self.navigationController pushViewController:postVC animated:YES];
    }
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupFilterView];
    [self setupTestAnnotations];
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //[self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"tab-bar-map"];
        self.tabBarItem.title = NSLocalizedString(@"tabbar.map", @"");
    }
    return self;
}

@end
