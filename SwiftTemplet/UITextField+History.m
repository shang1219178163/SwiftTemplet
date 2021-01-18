//
//  UITextField+History.m
//  NNCategoryPro
//
//  Created by Bin Shang on 2019/11/11.
//

#import "UITextField+History.h"
#import <objc/runtime.h>

@interface NNHistoryTarget()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSString *selectedText;

@property (nonatomic, weak) UITextField *textField;

@end

@implementation NNHistoryTarget

- (NSMutableArray<NSString *> *)list{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setList:(NSMutableArray<NSString *> *)list{
    objc_setAssociatedObject(self, @selector(list), list, OBJC_ASSOCIATION_RETAIN);
    self.selectedText = list.firstObject;
    [self.tableView reloadData];
    if (self.block) {
        self.block(self);
    }
}

#pragma mark -tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.blockCellForRow && self.blockCellForRow(tableView, indexPath, self.list[indexPath.row])) {
        return self.blockCellForRow(tableView, indexPath, self.list[indexPath.row]);
    }
    
    static NSString *identifier = @"UITextFieldHistoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.separatorInset = UIEdgeInsetsZero;
    cell.textLabel.textColor = UIColor.grayColor;
    cell.textLabel.font = self.textField.font ? : [UIFont systemFontOfSize:15];

    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedText = self.list[indexPath.row];
    [self hideHistroy];
    
    self.textField.text = self.selectedText;
    if (self.block) {
        self.block(self);
    }
    
    if ([self.textField.rightView isKindOfClass:[UIButton class]]) {
        UIButton *sender = (UIButton *)self.textField.rightView;
        sender.selected = !sender.selected;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return tableView.rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (self.list.count == 0) {
//        return UIView();
//    }
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sender setTitle:@"全部清除" forState:UIControlStateNormal];
    [sender addTarget:self action:@selector(clearHistory) forControlEvents:UIControlEventTouchUpInside];
    return sender;
}
#pragma mark -functions

- (void)showHistory{
    if (self.tableView.superview || !self.list) {
        return;
    }
    if (self.list.count == 0) {
        NSLog(@"%s%@", __func__, @"列表为空!!!");
        return;
    }
    self.tableView.frame = CGRectMake(CGRectGetMinX(self.textField.frame),
                                      CGRectGetMaxY(self.textField.frame),
                                      CGRectGetWidth(self.textField.frame),
                                      1);
    [self.textField.superview addSubview:self.tableView];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = self.tableView.rowHeight*(self.list.count + 1);

    [UIView animateWithDuration:0.35 animations:^{
        self.tableView.frame = rect;
    }];
}

- (void)hideHistroy{
    if (!self.tableView.superview) {
        return;
    }
    
    CGRect rect = self.tableView.frame;
    rect.size.height = 1;
    
    [UIView animateWithDuration:0.35 animations:^{
        self.tableView.frame = rect;
    } completion:^(BOOL finished) {
        [self.tableView removeFromSuperview];
    }];
}

- (void)clearHistory{
    [self.list removeAllObjects];
    self.selectedText = nil;
    [self hideHistroy];
    if (self.block) {
        self.block(self);
    }
}

- (void)handleAction:(UIButton *)sender{
    sender.selected = !sender.selected;
//    DDLog(@"isSelected_%@", @(sender.isSelected));
    if (sender.isSelected) {
        [self.textField.target showHistory];
    } else {
        [self.textField.target hideHistroy];
    }

}
#pragma mark -lazy
- (UITableView *)tableView{
    UITableView *view = objc_getAssociatedObject(self, _cmd);
    if (view) {
        return view;
    }
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITextFieldHistoryCell"];
    table.rowHeight = 45;
    table.layer.borderColor = UIColor.lightGrayColor.CGColor;
    table.layer.borderWidth = 0.5;
    table.delegate = self;
    table.dataSource = self;
    objc_setAssociatedObject(self, @selector(tableView), table, OBJC_ASSOCIATION_RETAIN);
    return table;
}

@end



@implementation UITextField (History)

- (NNHistoryTarget *)target{
    NNHistoryTarget *obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    NNHistoryTarget *tmp = [[NNHistoryTarget alloc]init];
    tmp.textField = self;
    
    tmp.textField.rightViewMode = UITextFieldViewModeAlways;
    tmp.textField.rightView = ({
        UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
        [sender setTitle:@"展开" forState:UIControlStateNormal];
        [sender setTitle:@"收起" forState:UIControlStateSelected];
        [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
        [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        sender.titleLabel.font = [UIFont systemFontOfSize:15];
        sender.frame = CGRectMake(0, 0, 50, 30);
        [sender addTarget:tmp action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        sender;
    });
    
    if (!tmp.textField.backgroundColor) {
        tmp.textField.layer.borderColor = UIColor.lightGrayColor.CGColor;
        tmp.textField.layer.borderWidth = 0.5;
    }    
    objc_setAssociatedObject(self, @selector(target), tmp, OBJC_ASSOCIATION_RETAIN);
    return tmp;
}


@end



