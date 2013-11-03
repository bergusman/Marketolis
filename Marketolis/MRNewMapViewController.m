//
//  MRNewMapViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewMapViewController.h"

#import "MROfferViewController.h"

#import "MRPointAnnotation.h"
#import "MROfferAnnotationView.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import <ViewDeck/IIViewDeckController.h>
#import <MapKit/MapKit.h>

#define TO_USER_LOCATION_RADIUS 1000

@interface MRNewMapViewController () <
    MKMapViewDelegate,
    UISearchBarDelegate
>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UIImageView *filterBackgroundImageView;
@property (weak, nonatomic) IBOutlet UITextField *filterTextField;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MRNewMapViewController

#pragma mark - Setups

- (void)setupFilterView {
    UIImage *bg = [UIImage imageNamed:@"map-search-filed"];
    bg = [bg stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    self.filterBackgroundImageView.image = bg;
    
    self.filterTextField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map-search-button-clear"]];
}

- (void)setupTestAnnotations {
    MRPointAnnotation *pointAnnotation = [[MRPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(45, 52);
    [self.mapView addAnnotation:pointAnnotation];
}

#pragma mark - Actions

- (IBAction)menuButtonTouchUpInside:(id)sender {
    //[self.viewDeckController openLeftViewAnimated:YES];
}

- (IBAction)addOfferButtonTouchUpInside:(id)sender {
}

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
    
    static NSString *annotationId = @"OfferAnnotation";
    MROfferAnnotationView *annotationView = (MROfferAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationId];
    if (!annotationView) {
        annotationView = [[MROfferAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationId];
        [annotationView sizeToFit];
    }
    
    [annotationView.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    annotationView.priceLabel.text = @"2,500 руб.";
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view.annotation isKindOfClass:[MKUserLocation class]]) {
        return;
    }
    
    [mapView deselectAnnotation:view.annotation animated:YES];
    
    if ([view.annotation isKindOfClass:[MRPointAnnotation class]]) {
        MROfferViewController *offerVc = [[MROfferViewController alloc] init];
        [self.navigationController pushViewController:offerVc animated:YES];
    }
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self setupFilterView];
    [self setupTestAnnotations];
    
    self.navigationItem.titleView = self.searchBar;
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
        self.title = NSLocalizedString(@"tabbar.map", @"");
    }
    return self;
}

@end