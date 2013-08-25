//
//  MRMenuViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 12.08.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRMenuViewController.h"

#import "MRMapViewController.h"
#import "MRSettingsViewController.h"
#import "MROffersViewController.h"
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
        @"map",
        @"favorites",
        @"history",
        @"my_offers",
        @"messages",
        @"settings"
    ];
    
    self.itemIcons = @{
        @"map": @"menu-icon-map",
        @"favorites": @"menu-icon-favorites",
        @"history": @"menu-icon-history",
        @"my_offers": @"menu-icon-added-by-me",
        @"messages": @"menu-icon-messages",
        @"settings": @"menu-icon-settings"
    };
    
    self.itemTitles = @{
        @"map": NSLocalizedString(@"menu.item.map", @""),
        @"favorites": NSLocalizedString(@"menu.item.favorites", @""),
        @"history": NSLocalizedString(@"menu.item.history", @""),
        @"my_offers": NSLocalizedString(@"menu.item.my_offers", @""),
        @"messages": NSLocalizedString(@"menu.item.messages", @""),
        @"settings": NSLocalizedString(@"menu.item.settings", @"")
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
    cell.badgeView.text = [self badgeTextForItem:item];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *item = self.items[indexPath.row];
    
    UIViewController *vc;
    
    if ([item isEqualToString:@"map"]) {
        MRMapViewController *mapVc = [[MRMapViewController alloc] init];
        vc = mapVc;
    }
    else if ([item isEqualToString:@"settings"]) {
        MRSettingsViewController *settingsVc = [[MRSettingsViewController alloc] init];
        vc = settingsVc;
    }
    else if ([item isEqualToString:@"history"]) {
        MROffersViewController *offersVc = [[MROffersViewController alloc] init];
        offersVc.title = NSLocalizedString(@"history.title", @"");
        vc = offersVc;
    }
    else if ([item isEqualToString:@"favorites"]) {
        MROffersViewController *offersVc = [[MROffersViewController alloc] init];
        offersVc.title = NSLocalizedString(@"favorites.title", @"");
        vc = offersVc;
    }
    else if ([item isEqualToString:@"my_offers"]) {
        MROffersViewController *offersVc = [[MROffersViewController alloc] init];
        offersVc.title = NSLocalizedString(@"my_offers.title", @"");
        vc = offersVc;
    }
    else if ([item isEqualToString:@"messages"]) {
        MRMessagesViewController *messagesVc = [[MRMessagesViewController alloc] init];
        vc = messagesVc;
    }
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.viewDeckController.centerController = nc;
    [self.viewDeckController closeLeftViewAnimated:YES];
}

@end
