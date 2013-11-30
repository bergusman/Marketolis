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

#import <MapKit/MapKit.h>

@interface MRPostViewController () <
    UIScrollViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

// Photos
@property (strong, nonatomic) IBOutlet UIView *photosView;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *photosPageControl;

// Details
@property (strong, nonatomic) IBOutlet UIView *detailsView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *sellerLabel;

@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *writeButton;

@property (weak, nonatomic) IBOutlet UILabel *viewCountLabel;

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

- (void)setupLocalizedStrings {
    [self.callButton setTitle:NSLocalizedString(@"post.call.button", @"") forState:UIControlStateNormal];
    [self.writeButton setTitle:NSLocalizedString(@"post.write.button", @"") forState:UIControlStateNormal];
}

#pragma mark - Content

- (void)scrollToPhotoAtIndex:(NSInteger)index {
    // TODO: Check index range
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.photosCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)layoutContent {
    [self layoutDetails];
    
    CGRect r = self.detailsView.frame;
    r.origin.y = 357;
    self.detailsView.frame = r;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, r.size.height + 357);
}

- (void)layoutDetails {
    CGFloat y;
    CGRect r;
    
    y = 40;
    
    // Title
    CGRect titleRect = [self.titleLabel.text boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName: self.titleLabel.font}
                                                          context:nil];
    
    r = self.titleLabel.frame;
    r.origin.y = y;
    r.size.height = ceil(titleRect.size.height);
    self.titleLabel.frame = r;
    
    y += r.size.height + 10;
    
    // Details
    CGRect detailsRect = [self.detailsLabel.text boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName: self.detailsLabel.font}
                                                              context:nil];
    
    r = self.detailsLabel.frame;
    r.origin.y = y;
    r.size.height = ceil(detailsRect.size.height);
    self.detailsLabel.frame = r;
    
    y += r.size.height + 10;
    
    // Map
    r = self.mapView.frame;
    r.origin.y = y;
    self.mapView.frame = r;
    
    y += r.size.height + 10;
    
    // Address
    CGRect addressRect = [self.detailsLabel.text boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName: self.addressLabel.font}
                                                              context:nil];
    
    r = self.addressLabel.frame;
    r.origin.y = y;
    r.size.height = ceil(addressRect.size.height);
    self.addressLabel.frame = r;
    
    y += r.size.height + 10;
    
    // Seller
    CGRect sellerRect = [self.detailsLabel.text boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX)
                                                             options:NSStringDrawingUsesLineFragmentOrigin
                                                          attributes:@{NSFontAttributeName: self.sellerLabel.font}
                                                             context:nil];
    
    r = self.sellerLabel.frame;
    r.origin.y = y;
    r.size.height = ceil(sellerRect.size.height);
    self.sellerLabel.frame = r;
    
    y += r.size.height + 10;
    
    r = self.detailsView.frame;
    r.size.height = y + 300;
    self.detailsView.frame = r;
}

- (void)fillDetails {
    self.dateLabel.text = @"17 августа 2013";
    self.titleLabel.text = @"MacBook Air mid 2013, 256 GB SSD, 2400 GHz 2-core CPU, 8 GB RAM";
    self.detailsLabel.text = @"В хорошем состоянии, яркий дисплей, хороший мягкий ход клавишь, глючноватый тачпад, вмятина с боку от падения на роликах, зарядка в коплекте";
    self.viewCountLabel.text = [NSString stringWithFormat:@"%@: %d", NSLocalizedString(@"post.views", @""), 324];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"Адрес: Россия, город Москва, улица Тверская дом 34 квартира 43"];
    [attrString addAttribute:NSForegroundColorAttributeName value:MR_RGB(102, 102, 102) range:NSMakeRange(0, [attrString.string length])];
    [attrString addAttribute:NSForegroundColorAttributeName value:MR_RGB(0, 0, 0) range:NSMakeRange(0, 6)];
    self.addressLabel.attributedText = attrString;
}

#pragma mark - Actions

- (void)editBarButtonAction:(id)sender {
    MRPostEditorViewController *editorVC = [[MRPostEditorViewController alloc] init];
    [self.navigationController pushViewController:editorVC animated:YES];
}

- (IBAction)photosPageControlValueChanged:(id)sender {
    [self scrollToPhotoAtIndex:self.photosPageControl.currentPage];
}

- (IBAction)callButtonTouchUpInside:(id)sender {
}

- (IBAction)writeButtonTouchUpInside:(id)sender {
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.photosCollectionView) {
        if (scrollView.dragging) {
            NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5);
            self.photosPageControl.currentPage = index;
        }
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MRPostPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://cs412125.vk.me/v412125123/2864/IrtSuSEGg4w.jpg"] placeholderImage:nil];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: show photo in photo viewer
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupPhotosCollectionView];
    [self setupLocalizedStrings];
    
    [self.scrollView addSubview:self.photosView];
    [self.scrollView addSubview:self.detailsView];
    
    self.photosPageControl.numberOfPages = 10;
    
    self.scrollView.contentSize = CGSizeMake(320, 800);
    
    [self fillDetails];
    [self layoutContent];
}

@end
