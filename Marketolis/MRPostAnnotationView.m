//
//  MRPostAnnotationView.h
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPostAnnotationView.h"

#import "MRRubleLabel.h"

@interface MRPostAnnotationView ()

@end

@implementation MRPostAnnotationView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"map-item"];
        
        // TODO: Determine center offset for pin
        self.centerOffset = CGPointMake(0, -48);
        
        _photoImageView = [[UIImageView alloc] init];
        _photoImageView.frame = CGRectMake(2, 2, 60, 60);
        _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.clipsToBounds = YES;
        [self addSubview:_photoImageView];
        
        _priceLabel = [[MRRubleLabel alloc] init];
        _priceLabel.frame = CGRectMake(2, 62, 61, 18);
        _priceLabel.backgroundColor = [UIColor clearColor];
        _priceLabel.textColor = MR_RGB(102, 102, 102);
        _priceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priceLabel];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(65, 89);
}
@end
