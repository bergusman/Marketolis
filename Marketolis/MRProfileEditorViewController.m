//
//  MRProfileEditorViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/12/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRProfileEditorViewController.h"

@interface MRProfileEditorViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MRProfileEditorViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = NSLocalizedString(@"profile.editor.title", @"");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                           target:self
                                                                                           action:@selector(saveBarButtonTouchUpInside:)];
}

#pragma mark - Actions

- (void)saveBarButtonTouchUpInside:(id)sender {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NameCell"];
            UITextField *textField = [[UITextField alloc] init];
            textField.frame = CGRectMake(0, 0, 200, 44);
            cell.accessoryView = textField;
            cell.textLabel.text = NSLocalizedString(@"profile.editor.name", @"");
        }
        return cell;
    }
    else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceiveCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReceiveCell"];
            UISwitch *checkbox = [[UISwitch alloc] init];
            checkbox.onTintColor = [UIColor redColor];
            cell.accessoryView = checkbox;
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = NSLocalizedString(@"profile.editor.receive.calls", @"");
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = NSLocalizedString(@"profile.editor.receive.messages", @"");
        }
        
        return cell;
    }
    else if (indexPath.section == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SharingCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SharingCell"];
            UISwitch *checkbox = [[UISwitch alloc] init];
            checkbox.onTintColor = [UIColor redColor];
            cell.accessoryView = checkbox;
        }
        
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"social-icon-facebook"];
            cell.textLabel.text = NSLocalizedString(@"profile.editor.sharing.facebook", @"");
        }
        if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"social-icon-twitter"];
            cell.textLabel.text = NSLocalizedString(@"profile.editor.sharing.twitter", @"");
        }
        if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"social-icon-vkontakte"];
            cell.textLabel.text = NSLocalizedString(@"profile.editor.sharing.vk", @"");
        }
        if (indexPath.row == 3) {
            cell.imageView.image = [UIImage imageNamed:@"social-icon-odnoklassniki"];
            cell.textLabel.text = NSLocalizedString(@"profile.editor.sharing.ok", @"");
        }
        
        return cell;
    }
    
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return NSLocalizedString(@"profile.editor.receive.title", @"");
    }
    else if (section == 2) {
        return NSLocalizedString(@"profile.editor.sharing.title", @"");
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

@end
