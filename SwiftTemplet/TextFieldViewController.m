//
//  TextFieldViewController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/13.
//  Copyright © 2021 BN. All rights reserved.
//

#import "TextFieldViewController.h"
#import "UITextField+History.h"
#import "UIButton+Menu.h"

#import <Masonry/Masonry.h>

@interface TextFieldViewController ()

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];

//    UIButton *sender = [UIButton buttonWithType:UIButtonTypeSystem];
//    [sender setTitle:@"change" forState:UIControlStateNormal];
//    sender.frame = CGRectMake(0, 0, 60, 30);
//    [sender addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:sender];
    
    self.textField.frame = CGRectMake(20, 20, 300, 35);
    self.button.frame = CGRectMake(20, 120, 60, 35);

//    self.textField.rightViewMode = UITextFieldViewModeAlways;
//    self.textField.rightView = ({
//        UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
//        [sender setTitle:@"展开" forState:UIControlStateNormal];
//        [sender setTitle:@"收起" forState:UIControlStateSelected];
//        [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
//        [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateSelected];
//        sender.titleLabel.font = [UIFont systemFontOfSize:15];
//        sender.frame = CGRectMake(0, 0, 50, 30);
//        [sender addTarget:tmp action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
//        sender;
//    });
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
 
//    [self.textField makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(10);
//        make.left.equalTo(self).offset(10);
//        make.right.equalTo(self).offset(-10);
//        make.height.equalTo(25);
//    }];
}

#pragma mark -funtions
//- (void)handleAction:(UIButton *)sender{
//    sender.selected = !sender.selected;
////    DDLog(@"isSelected_%@", @(sender.isSelected));
//    if (sender.isSelected) {
//        [self.textField.target showHistory];
//    } else {
//        [self.textField.target hideHistroy];
//    }
//}

#pragma mark -lazy
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.placeholder = @"请输入";
        _textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];

        _textField.target.list = @[@"111", @"222", @"333", @"444", @"555"].mutableCopy;
        _textField.target.block = ^(NNHistoryTarget *tagget) {
            DDLog(@"%@", tagget.selectedText);
        };
    }
    return _textField;
}

- (UIButton *)button{
    if (!_button) {
        _button = ({
            UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
            [sender setTitle:@"下拉列表" forState:UIControlStateNormal];
            [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
//            [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateSelected];
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

@end
