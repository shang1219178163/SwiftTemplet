//
//  LeftRightTableViewController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

#import "LeftRightTableViewController.h"
#import <Masonry/Masonry.h>
#import "SwiftTemplet-Swift.h"

@interface LeftRightTableViewController ()

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@end


@implementation LeftRightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];

}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    self.leftTableView.frame = CGRectMake(0, 0, width*0.3, CGRectGetHeight(self.view.bounds));
    self.rightTableView.frame = CGRectMake(CGRectGetMaxX(self.leftTableView.frame),
                                           0,
                                           width*0.7,
                                           CGRectGetHeight(self.view.bounds));
}


#pragma mark - tableView 数据源代理方法 -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) return 40;
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.leftTableView) return 1;
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    // 左边的 view
    if (tableView == self.leftTableView) {
        cell = [NNLeftTableViewCell dequeueReusableCell:tableView];
        cell.textLabel.text = [NSString stringWithFormat:@"种类%ld", indexPath.row];
        // 右边的 view
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld组-第%ld行", indexPath.section, indexPath.row];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) return [NSString stringWithFormat:@"第 %ld 组", section];
    return nil;
}

//MARK: - 点击 cell 的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 选中 左侧 的 tableView
    if (tableView == self.leftTableView) {
        NSIndexPath *moveToIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        // 将右侧 tableView 移动到指定位置
        [self.rightTableView selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        // 取消选中效果
        [self.rightTableView deselectRowAtIndexPath:moveToIndexPath animated:YES];
    }
}

//MARK: - 一个方法就能搞定 右边滑动时跟左边的联动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.leftTableView) return;
    // 取出显示在 视图 且最靠上 的 cell 的 indexPath
    NSIndexPath *topHeaderViewIndexpath = self.rightTableView.indexPathsForVisibleRows.firstObject;
    // 左侧 talbelView 移动的 indexPath
    NSIndexPath *moveToIndexPath = [NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    // 移动 左侧 tableView 到 指定 indexPath 居中显示
    [self.leftTableView selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];

}

#pragma mark -funtions

#pragma mark - 懒加载
- (UITableView *)leftTableView {
    if (!_leftTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        tableView.backgroundColor = [UIColor systemRedColor];
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.dataSource = self;
        tableView.delegate = self;

        _leftTableView = tableView;
    }
    return _leftTableView;
}

- (UITableView *)rightTableView {
    if (!_rightTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        tableView.backgroundColor = [UIColor systemGreenColor];
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.dataSource = self;
        tableView.delegate = self;

        _rightTableView = tableView;
    }
    return _rightTableView;
}
@end
