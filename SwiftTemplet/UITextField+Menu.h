//
//  UITextField+Menu.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/22.
//  Copyright © 2021 BN. All rights reserved.
//

/*
 实现效果: 下拉列表
 示例:
 @property (nonatomic, strong) UITextField *textField;

 #pragma mark -lazy
 - (UITextField *)textField{
     if (!_textField) {
         _textField = [[UITextField alloc]init];
         _textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];

         _textField.Menutarget.list = @[@"111", @"222", @"333", @"444", @"555"].mutableCopy;
         _textField.menutarget.block = ^(NNButtonMenuTarget *tagget) {
             DDLog(@"%@", tagget.selectedText);
         };
     }
     return _textField;
 }
 **/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNTextFieldMenuTarget : NSObject

@property (nonatomic, strong) NSMutableArray<NSString *> *list;
@property (nonatomic, strong, readonly, nullable) NSString *selectedText;

@property (nonatomic, copy) UITableViewCell *(^blockCellForRow)(UITableView *tableView, NSIndexPath *indexPath, NSString *selectedText);
@property (nonatomic, copy) void(^block)(NNTextFieldMenuTarget *);

@end



@interface UITextField (Menu)

@property (nonatomic, strong, readonly) NNTextFieldMenuTarget *menuTarget;

@end

NS_ASSUME_NONNULL_END
