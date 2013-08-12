//
//  MROfferAnnotationView.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MROfferAnnotationView.h"

@interface MROfferAnnotationView ()

@end

@implementation MROfferAnnotationView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"map-item-offer-card"];
        
        self.centerOffset = CGPointMake(0, -41);
        
        _photoImageView = [[UIImageView alloc] init];
        _photoImageView.frame = CGRectMake(4, 4, 59, 54);
        _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.clipsToBounds = YES;
        [self addSubview:_photoImageView];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.frame = CGRectMake(2, 58, 64, 16);
        _priceLabel.backgroundColor = [UIColor clearColor];
        _priceLabel.textColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1];
        _priceLabel.font = [UIFont boldSystemFontOfSize:10];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priceLabel];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(68, 85);
}
@end
