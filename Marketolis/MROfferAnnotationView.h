//
//  MROfferAnnotationView.h
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MROfferAnnotationView : MKAnnotationView

@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UILabel *priceLabel;

@end
