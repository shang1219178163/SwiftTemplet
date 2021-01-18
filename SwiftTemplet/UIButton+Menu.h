//
//  UIButton+Menu.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/14.
//  Copyright © 2021 BN. All rights reserved.
//
/*
 实现效果: 下拉列表
 示例:
 @property (nonatomic, strong) UIButton *button;

 #pragma mark -lazy
 - (UIButton *)button{
     if (!_button) {
         _button = ({
             UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
             [sender setTitle:@"下拉列表" forState:UIControlStateNormal];
             [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
             sender.titleLabel.font = [UIFont systemFontOfSize:15];
             
             sender.titleLabel.adjustsFontSizeToFitWidth = YES;
             sender.imageView.contentMode = UIViewContentModeScaleAspectFit;
             sender;
         });
                 
         _button.target.hiddenClearButton = true;
         _button.target.list = @[@"北京", @"上海", @"广州", @"深圳", @"西安"].mutableCopy;
         _button.target.block = ^(NNMenuTarget *tagget) {
             DDLog(@"%@", tagget.selectedText);
         };
     }
     return _button;
 }
 **/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNMenuTarget : NSObject

@property (nonatomic, strong) NSMutableArray<NSString *> *list;
@property (nonatomic, strong, readonly, nullable) NSString *selectedText;
@property (nonatomic, assign) bool hiddenClearButton;

@property (nonatomic, copy) UITableViewCell *(^blockCellForRow)(UITableView *tableView, NSIndexPath *indexPath, NSString *selectedText);
@property (nonatomic, copy) void(^block)(NNMenuTarget *);

@end


@interface UIButton (Menu)

@property (nonatomic, strong, readonly) NNMenuTarget *target;

@end

NS_ASSUME_NONNULL_END
