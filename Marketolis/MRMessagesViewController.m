//
//  MRMessagesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 8/13/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMessagesViewController.h"

#import "MRChatViewController.h"

#import "MRDialogCell.h"

#import "MRInterfaceHelper.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRMessagesViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dialogs;

@end

@implementation MRMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupTableView];
    
    NSMutableArray *dialogs = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [dialogs addObject:@"Bingo"];
    }
    self.dialogs = dialogs;
}

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"messages.title", @"");
    [MRInterfaceHelper setupLeftBarButtonItemForViewController:self];
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRDialogCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"DialogCell"];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MRChatViewController *chatVc = [[MRChatViewController alloc] init];
    [self.navigationController pushViewController:chatVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MRDialogCell height];
}

@end
