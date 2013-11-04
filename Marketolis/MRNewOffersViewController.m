//
//  MRNewFavoritesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewOffersViewController.h"

#import "MROfferViewController.h"

#import "MROfferCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRNewOffersViewController ()  <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *offerTypesSegmentedControl;

@end

@implementation MRNewOffersViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    [self.offerTypesSegmentedControl setTitle:NSLocalizedString(@"offers.type.my", @"") forSegmentAtIndex:0];
    [self.offerTypesSegmentedControl setTitle:NSLocalizedString(@"offers.type.favorites", @"") forSegmentAtIndex:1];
    [self.offerTypesSegmentedControl setTitle:NSLocalizedString(@"offers.type.recent", @"") forSegmentAtIndex:2];
    [self.offerTypesSegmentedControl sizeToFit];
    self.navigationItem.titleView = self.offerTypesSegmentedControl;
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MROfferCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OfferCell"];
}

#pragma mark - Actions

- (IBAction)offerTypesSegmentedControlChanged:(id)sender {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"OfferCell";
    MROfferCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    
    cell.badgeView.text = @"32,000 руб.";
    
    if (indexPath.row % 2) {
        cell.titleLabel.text = @"Bingo bongo\nSpecial Huecial";
    } else {
        cell.titleLabel.text = @"Bingo bongo\nSpecial Huecial\nZeptus Loptus";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MROfferViewController *offerVC = [[MROfferViewController alloc] init];
    [self.navigationController pushViewController:offerVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MROfferCell height];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupTableView];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.offers", @"");
    }
    return self;
}

@end
