//
//  MRPostViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPostViewController.h"

#import "MRPostEditorViewController.h"

#import "MRPostPhotoCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRPostViewController () <
    UIScrollViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *photosView;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *photosPageControl;

@end

@implementation MRPostViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"post.title", @"");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"post.edit.button", @"")
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(editBarButtonAction:)];
}

- (void)setupPhotosCollectionView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRPostPhotoCell class]) bundle:[NSBundle mainBundle]];
    [self.photosCollectionView registerNib:nib forCellWithReuseIdentifier:@"PhotoCell"];
}

#pragma mark - Actions

- (void)editBarButtonAction:(id)sender {
    MRPostEditorViewController *editorVC = [[MRPostEditorViewController alloc] init];
    [self.navigationController pushViewController:editorVC animated:YES];
}

#pragma mark - UIScrollViewDelegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MRPostPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://cs412125.vk.me/v412125123/2864/IrtSuSEGg4w.jpg"] placeholderImage:nil];
    return cell;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    [self setupPhotosCollectionView];
    [self.scrollView addSubview:self.photosView];
}

@end
