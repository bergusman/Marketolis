//
//  MRMenuViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMenuViewController.h"

#import "MRMessagesViewController.h"

#import "MRMenuItemCell.h"

#import <IIViewDeckController.h>

@interface MRMenuViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *items;

@property (strong, nonatomic) NSDictionary *itemIcons;
@property (strong, nonatomic) NSDictionary *itemTitles;

@end

@implementation MRMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupItems];
    [self setupTableView];
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MRMenuItemCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ItemCell"];
}

- (void)setupItems {
    self.items = @[
        @"settings",
        @"history",
        @"favorites",
        @"messages"
    ];
    
    self.itemIcons = @{
        @"settings": @"menu-icon-settings",
        @"history": @"menu-icon-history",
        @"favorites": @"menu-icon-favorites",
        @"messages": @"menu-icon-messages"
    };
    
    self.itemTitles = @{
        @"settings": @"Настройки",
        @"history": @"Просмотренные",
        @"favorites": @"Избранное",
        @"messages": @"Сообщения"
    };
}

#pragma mark - Helpers

- (NSString *)iconNameForItem:(NSString *)item {
    return self.itemIcons[item];
}

- (NSString *)titleForItem:(NSString *)item {
    return self.itemTitles[item];
}

- (NSString *)badgeTextForItem:(NSString *)item {
    if ([item isEqualToString:@"messages"]) {
        return @"10";
    }
    return nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ItemCell";
    MRMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    NSString *item = self.items[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:[self iconNameForItem:item]];
    cell.titleLabel.text = [self titleForItem:item];
    cell.badgeLabel.text = [self badgeTextForItem:item];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *item = self.items[indexPath.row];
    
    if ([item isEqualToString:@"settings"]) {
        
    } else if ([item isEqualToString:@"history"]) {
        
    } else if ([item isEqualToString:@"favorites"]) {
        
    } else if ([item isEqualToString:@"messages"]) {
        MRMessagesViewController *messagesVc = [[MRMessagesViewController alloc] init];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:messagesVc];
        self.viewDeckController.centerController = nc;
    }
    
    [self.viewDeckController closeLeftViewAnimated:YES];
}

@end
