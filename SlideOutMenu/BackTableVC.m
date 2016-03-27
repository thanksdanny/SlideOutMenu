//
//  BackTableVC.m
//  SlideOutMenu
//
//  Created by Danny Ho on 3/26/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "BackTableVC.h"
#import "SWRevealViewController.h"
#import "FriendRead.h"
#import "Channel.h"
#import "ReadLater.h"

@interface BackTableVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger isSameViewController; // 辅助变量，表示是否是刚刚显示过的控制器

@end

@implementation BackTableVC


- (NSArray *)tableArray {
    return @[@"FriendRead", @"Channel", @"ReadLater"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell self] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellStyleDefault;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self tableArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                                   reuseIdentifier:@"cell"];
    cell.textLabel.text = [self tableArray][indexPath.row];
    
    return cell;
}

#pragma mark - delegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取ReavelViewController对象
    SWRevealViewController *revealViewController = self.revealViewController;
    
    // 优化，和cell的循环利用同样的思想
    NSInteger curRow = indexPath.row;
    if (curRow == self.isSameViewController) {
        [revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        return;
    }
    
    // 跳到其他页面就要重新创建其页面
    UIViewController *newFrontVC = nil;
    if (curRow == 0) {
        newFrontVC = [FriendRead new];
    } else if (curRow == 1) {
        newFrontVC = [Channel new];
    } else if (curRow == 2) {
        newFrontVC = [ReadLater new];
    }
    
    // 创建
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newFrontVC];
    [revealViewController pushFrontViewController:navigationController animated:YES];
    
    self.isSameViewController = curRow;
}


@end
