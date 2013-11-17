//
//  MRViewController.h
//  Marketolis
//
//  Created by Vitaly Berg on 11/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleAnalytics-iOS-SDK/GAITrackedViewController.h>

@interface MRViewController : GAITrackedViewController

@property (strong, nonatomic) IBOutlet NSString *analyticTitle;

@end
