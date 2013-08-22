//
//  MROfferViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/22/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MROfferViewController.h"

#import "MROfferPhotoCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MROfferViewController () <
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;

@end

@implementation MROfferViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPhotoCollectionView];
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Setups

- (void)setupPhotoCollectionView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MROfferPhotoCell class]) bundle:[NSBundle mainBundle]];
    [self.photoCollectionView registerNib:nib forCellWithReuseIdentifier:@"PhotoCell"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"PhotoCell";
    MROfferPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://cs412125.vk.me/v412125123/2864/IrtSuSEGg4w.jpg"] placeholderImage:nil];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
