//
//  UIButton+Menu.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/14.
//  Copyright © 2021 BN. All rights reserved.
//

#import "UIButton+Menu.h"
#import <objc/runtime.h>

@interface NNButtonMenuTarget()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSString *selectedText;

@property (nonatomic, weak) UIButton *button;

@end


@implementation NNButtonMenuTarget

- (void)dealloc{
    [self.button removeObserver:self forKeyPath:@"selected"];
}

#pragma mark -observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isKindOfClass:[UIButton class]]) {
//        UIButton *sender = (UIButton *)object;
        if ([keyPath isEqualToString:@"selected"]) {
            NSNumber *newValue = change[NSKeyValueChangeNewKey];
//            DDLog(@"newValue: %@", newValue);
            if (newValue.boolValue) {
                [self showHistory];
            } else {
                [self hideHistroy];
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark -set,get
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
    cell.textLabel.font = self.button.titleLabel.font ? : [UIFont systemFontOfSize:15];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedText = self.list[indexPath.row];
    [self hideHistroy];
    
    [self.button setTitle:self.selectedText forState:UIControlStateNormal];
    if (self.block) {
        self.block(self);
    }
    
    self.button.selected = !self.button.selected;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = self.hiddenClearButton ? 0.01 : tableView.rowHeight;
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.hiddenClearButton) {
        return [[UIView alloc]init];
    }
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
    self.tableView.frame = CGRectMake(CGRectGetMinX(self.button.frame),
                                      CGRectGetMaxY(self.button.frame),
                                      CGRectGetWidth(self.button.frame),
                                      1);
    [self.button.superview addSubview:self.tableView];
    NSInteger count = self.hiddenClearButton ? self.list.count : self.list.count + 1;
    
    CGRect rect = self.tableView.frame;
    rect.size.height = self.tableView.rowHeight*count;

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



@implementation UIButton (Menu)

- (NNButtonMenuTarget *)menuTarget{
    NNButtonMenuTarget *obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return obj;
    }
    NNButtonMenuTarget *target = [[NNButtonMenuTarget alloc]init];
    target.button = self;
    
    [target.button addObserver:target forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    objc_setAssociatedObject(self, @selector(menuTarget), target, OBJC_ASSOCIATION_RETAIN);
    return target;
}

@end



