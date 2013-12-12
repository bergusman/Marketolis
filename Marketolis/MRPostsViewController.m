//
//  MRNewFavoritesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRPostsViewController.h"

#import "MRPostViewController.h"

#import "MRPostCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRPostsViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *postTypesSegmentedControl;

@property (strong, nonatomic) NSMutableArray *posts;

@end

@implementation MRPostsViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    [self.postTypesSegmentedControl setTitle:NSLocalizedString(@"posts.type.my", @"") forSegmentAtIndex:0];
    [self.postTypesSegmentedControl setTitle:NSLocalizedString(@"posts.type.favorites", @"") forSegmentAtIndex:1];
    [self.postTypesSegmentedControl setTitle:NSLocalizedString(@"posts.type.recent", @"") forSegmentAtIndex:2];
    [self.postTypesSegmentedControl sizeToFit];
    self.navigationItem.titleView = self.postTypesSegmentedControl;
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRPostCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PostCell"];
}

- (void)setupPullToRefresh {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Content

- (void)generateTestPosts {
    NSMutableArray *posts = [NSMutableArray array];
    for (int i = 0; i < 50; i++) {
        [posts addObject:@"123"];
    }
    self.posts = posts;
}

#pragma mark - Actions

- (IBAction)postTypesSegmentedControlChanged:(id)sender {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)refreshControlValueChanged:(id)sender {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.refreshControl endRefreshing];
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"PostCell";
    MRPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //[cell.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    
    cell.badgeView.text = @"32,000 ђ";
    
    if (indexPath.row % 2) {
        cell.titleLabel.text = @"Bingo bongo\nSpecial Huecial";
    } else {
        cell.titleLabel.text = @"Bingo bongo\nSpecial Huecial\nZeptus Loptus";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.posts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MRPostViewController *postVC = [[MRPostViewController alloc] init];
    [self.navigationController pushViewController:postVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MRPostCell height];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupPullToRefresh];
    [self setupTableView];
    
    [self generateTestPosts];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"tab-bar-list"];
        self.tabBarItem.title = NSLocalizedString(@"tabbar.posts", @"");
    }
    return self;
}

@end
