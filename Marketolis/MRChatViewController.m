//
//  MRNewChatViewController.m
//  Marketolis
//
//  Created by Vitaly Berg on 11/4/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "MRChatViewController.h"

#import "MRLeftBubbleCell.h"
#import "MRRightBubbleCell.h"
#import "MRInputTextBar.h"

@interface MRChatViewController () <
    UITableViewDataSource,
    UITableViewDelegate,
    MRInputTextBarDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MRInputTextBar *inputTextBar;

@property (assign, nonatomic) CGFloat topInset;
@property (assign, nonatomic) UIEdgeInsets messagesInset;
@property (assign, nonatomic) UIEdgeInsets utilityInset;

@end

@implementation MRChatViewController

#pragma mark - Setups

- (void)setupNavigationItem {
    self.navigationItem.title = @"Chat";
}

- (void)setupTableView {
    UINib *nib;
    
    nib = [UINib nibWithNibName:NSStringFromClass([MRLeftBubbleCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"LeftCell"];
    
    nib = [UINib nibWithNibName:NSStringFromClass([MRRightBubbleCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RightCell"];
}

- (void)setupInputTextBar {
    //self.inputTextBar = [MRInputTextBar inputTextBarFromNib];
    //self.inputTextBar.delegate = self;
    //[self.view addSubview:self.inputTextBar];
}

- (void)addKeyboardObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Keyboard Notification Handlers

- (void)keyboardWillShow:(NSNotification *)notification {
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    {
        static NSString *cellId = @"LeftCell";
        MRLeftBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        return cell;
    }
    
    {
        static NSString *cellId = @"RightCell";
        MRRightBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    [self setupTableView];
    [self setupInputTextBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addKeyboardObserver];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeKeyboardObserver];
}

#pragma mark - NSObject

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
