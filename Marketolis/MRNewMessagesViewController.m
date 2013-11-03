//
//  MRNewMessagesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRNewMessagesViewController.h"

#import "MRChatViewController.h"

#import "MRDialogCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRNewMessagesViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dialogs;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation MRNewMessagesViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"messages.title", @"");
    self.navigationItem.titleView = self.segmentedControl;
    //[MRInterfaceHelper setupLeftBarButtonItemForViewController:self];
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRDialogCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"DialogCell"];
}

- (void)setupTestDialogs {
    NSMutableArray *dialogs = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [dialogs addObject:@"Bingo"];
    }
    self.dialogs = dialogs;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dialogs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"DialogCell";
    MRDialogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.read = indexPath.row % 2;
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    
    cell.badgeView.text = @"1 руб.";
    
    if (indexPath.row % 2) {
        
    } else {
        cell.titleLabel.text = @"Gumla Bumla Bubla\nDumla Vumla";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MRDialogCell height];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MRChatViewController *chatVc = [[MRChatViewController alloc] init];
    [self.navigationController pushViewController:chatVc animated:YES];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupTestDialogs];
    [self setupNavigationItem];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.messages", @"");
    }
    return self;
}

@end
