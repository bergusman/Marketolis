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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        
    } else if (section == 1) {
        
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
    }
    if (indexPath.section == 1) {
        
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationItem];
}

@end
