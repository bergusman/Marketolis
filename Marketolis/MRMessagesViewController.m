//
//  MRNewMessagesViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMessagesViewController.h"

#import "MRChatViewController.h"

#import "MRDialogCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MRMessagesViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *messagesTypesSegmentedControl;

@property (strong, nonatomic) NSArray *dialogs;

@end

@implementation MRMessagesViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    [self.messagesTypesSegmentedControl setTitle:NSLocalizedString(@"messages.type.selling", @"") forSegmentAtIndex:0];
    [self.messagesTypesSegmentedControl setTitle:NSLocalizedString(@"messages.type.buying", @"") forSegmentAtIndex:1];
    [self.messagesTypesSegmentedControl sizeToFit];
    self.navigationItem.titleView = self.messagesTypesSegmentedControl;
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

#pragma mark - Actions

- (IBAction)messagesTypesSegmentedControlChanged:(id)sender {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dialogs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"DialogCell";
    MRDialogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.read = indexPath.row % 2;
    //[cell.photoImageView setImageWithURL:[NSURL URLWithString:@"http://cs7004.vk.me/c540104/v540104123/10369/yWYN-dipi_Q.jpg"] placeholderImage:nil];
    
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
    MRChatViewController *chatVC = [[MRChatViewController alloc] init];
    [self.navigationController pushViewController:chatVC animated:YES];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupTableView];
    [self setupTestDialogs];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"tab-bar-chat"];
        self.tabBarItem.title = NSLocalizedString(@"tabbar.messages", @"");
    }
    return self;
}

@end
