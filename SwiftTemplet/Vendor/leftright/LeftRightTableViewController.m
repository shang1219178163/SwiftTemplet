//
//  LeftRightTableViewController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

#import "LeftRightTableViewController.h"

#define leftTableWidth  [UIScreen mainScreen].bounds.size.width * 0.3
#define rightTableWidth [UIScreen mainScreen].bounds.size.width * 0.7
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

#define leftCellIdentifier  @"leftCellIdentifier"
#define rightCellIdentifier @"rightCellIdentifier"

@interface LeftRightTableViewController ()

@property (nonatomic, weak) UITableView *leftTableView;

@property (nonatomic, weak) UITableView *rightTableView;

@property (nonatomic, weak) NSIndexPath *indexP;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIFont *selectedFont;

@end

@implementation LeftRightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    
    self.indexP = [NSIndexPath indexPathForRow:0 inSection:0];
    self.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    self.selectedFont = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];

    self.textColor = UIColor.blackColor;
    self.selectedTextColor = UIColor.systemBlueColor;
    
    self.backgroundColor = UIColor.groupTableViewBackgroundColor;
    self.selectedBackgroundColor = UIColor.whiteColor;
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
        cell = [tableView dequeueReusableCellWithIdentifier:leftCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"种类%ld", indexPath.row];
        cell.textLabel.backgroundColor = UIColor.clearColor;
        cell.backgroundColor = UIColor.groupTableViewBackgroundColor;

        BOOL isSelected = indexPath == self.indexP;
        cell.textLabel.font = isSelected ? self.selectedFont : self.font;
        cell.textLabel.textColor = isSelected ? self.selectedTextColor : self.textColor;
        cell.backgroundColor = isSelected ? self.selectedBackgroundColor : self.backgroundColor;

//        UIView *backgroundView = [[UIView alloc]init];
//        backgroundView.backgroundColor = UIColor.groupTableViewBackgroundColor;
//        cell.backgroundView = backgroundView;
//
//        UIView *selectedBackgroundView = [[UIView alloc]init];
//        selectedBackgroundView.backgroundColor = UIColor.whiteColor;
//        cell.selectedBackgroundView = selectedBackgroundView;
        // 右边的 view
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:rightCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld组-第%ld行", indexPath.section, indexPath.row];
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) return [NSString stringWithFormat:@"第 %ld 组", section];
    return nil;
}


#pragma mark - UITableViewDelegate 代理方法 -
//- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
//
//    这两个方法都不准确
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
//
//    这两个方法都不准确
//}

//MARK: - 一个方法就能搞定 右边滑动时跟左边的联动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.leftTableView) return;

    // 取出显示在 视图 且最靠上 的 cell 的 indexPath
    NSIndexPath *topHeaderViewIndexpath = [[self.rightTableView indexPathsForVisibleRows] firstObject];
    // 左侧 talbelView 移动的 indexPath
    NSIndexPath *moveToIndexPath = [NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    // 移动 左侧 tableView 到 指定 indexPath 居中显示
    [self.leftTableView selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];

    [self updateCellWithIndexPath:moveToIndexPath];
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
        
        [self updateCellWithIndexPath:indexPath];
    }
}

#pragma mark -funtions

-(void)updateCellWithIndexPath:(NSIndexPath *)indexpath{
    ///
    UITableViewCell *cell = [self.leftTableView cellForRowAtIndexPath:self.indexP];
    cell.textLabel.textColor = UIColor.blackColor;
    cell.textLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];

    UITableViewCell *newCell = [self.leftTableView cellForRowAtIndexPath:indexpath];
    newCell.textLabel.textColor = UIColor.systemBlueColor;
    newCell.textLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    self.indexP = indexpath;
    
    cell.backgroundColor = self.backgroundColor;
    newCell.backgroundColor = self.selectedBackgroundColor;
}

#pragma mark - 懒加载 tableView -
// MARK: - 左边的 tableView
- (UITableView *)leftTableView {
    if (!_leftTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, leftTableWidth, ScreenHeight)];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCellIdentifier];
        tableView.backgroundColor = [UIColor systemRedColor];
        tableView.tableFooterView = [[UIView alloc] init];
        
        tableView.dataSource = self;
        tableView.delegate = self;

        [self.view addSubview:tableView];
        _leftTableView = tableView;
    }
    return _leftTableView;
}

// MARK: - 右边的 tableView
- (UITableView *)rightTableView {
    if (!_rightTableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(leftTableWidth, 0, rightTableWidth, ScreenHeight)];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:rightCellIdentifier];
        tableView.backgroundColor = [UIColor systemGreenColor];
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];

        _rightTableView = tableView;
    }
    return _rightTableView;
}
@end
