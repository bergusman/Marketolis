//
//  MRPostViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/17/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPostViewController.h"

@interface MRPostViewController () <
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

#pragma mark - Actions

- (void)editBarButtonAction:(id)sender {
    
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
    
    [self.scrollView addSubview:self.photosView];
}

@end
