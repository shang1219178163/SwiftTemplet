//
//  TableSectionCornerListController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/31.
//  Copyright © 2020 BN. All rights reserved.
//

#import "TableSectionCornerListController.h"
#import "SwiftTemplet-Swift.h"


@interface TableSectionCornerListController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *dataList;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation TableSectionCornerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColor.whiteColor;

    self.title = @"TableSectionCorner";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(hanleActon:)];

    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)hanleActon:(UIBarButtonItem *)sender {

    
}

#pragma mark -UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"{%@, %@}", @(indexPath.section), @(indexPath.row)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc = [UIViewController new];
    [self.navigationController pushViewController:vc animated:true];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UILabel alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UILabel alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView addSectionRoundCorner:10 padding:15 cell:cell forRowAt:indexPath];
    return;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.separatorInset = UIEdgeInsets(0, 10, 0, 10);
//    //圆率
//    CGFloat cornerRadius = 15.0;
//    //大小
//    CGRect bounds = CGRectInset(cell.bounds, 10, 0);
//    //行数
//    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
//
//    //绘制曲线
//    UIBezierPath *bezierPath = nil;
//
//    if (indexPath.row == 0 && numberOfRows == 1) {
//        //一个为一组时,四个角都为圆角
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    } else if (indexPath.row == 0) {
//        //为组的第一行时,左上、右上角为圆角
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    } else if (indexPath.row == numberOfRows - 1) {
//        //为组的最后一行,左下、右下角为圆角
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    } else {
//        //中间的都为矩形
//        bezierPath = [UIBezierPath bezierPathWithRect:bounds];
//    }
//    //cell的背景色透明
//    cell.backgroundColor = [UIColor clearColor];
//    //新建一个图层
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = bezierPath.CGPath;
//    layer.fillColor = [UIColor whiteColor].CGColor;
//    //图层边框线条颜色
//    /*
//     如果self.tableView.style = UITableViewStyleGrouped时,每一组的首尾都会有一根分割线,目前我还没找到去掉每组首尾分割线,保留cell分割线的办法。
//     所以这里取巧,用带颜色的图层边框替代分割线。
//     这里为了美观,最好设为和tableView的底色一致。
//     设为透明,好像不起作用。
//     */
//    layer.strokeColor = [UIColor whiteColor].CGColor;
//    //将图层添加到cell的图层中,并插到最底层
//    [cell.layer insertSublayer:layer atIndex:0];

}

#pragma mark -layz

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
            tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.separatorInset = UIEdgeInsetsZero;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.backgroundColor = UIColor.groupTableViewBackgroundColor;
            
            tableView.estimatedRowHeight = 0.0;
            tableView.estimatedSectionHeaderHeight = 0.0;
            tableView.estimatedSectionFooterHeight = 0.0;
            tableView.rowHeight = 50;
            
            tableView.dataSource = self;
            tableView.delegate = self;

            //背景视图
//            UIView *view = [[UIView alloc]initWithFrame:tableView.bounds];
//            view.backgroundColor = UIColor.cyanColor;
//            tableView.backgroundView = view;
//            tableView.bounces = NO;
            tableView;
        });
    }
    return _tableView;
}

@end
