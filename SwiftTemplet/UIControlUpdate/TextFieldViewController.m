//
//  TextFieldViewController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/13.
//  Copyright © 2021 BN. All rights reserved.
//

#import "TextFieldViewController.h"
#import "UITextField+Menu.h"
#import "UIButton+Menu.h"
#import "UIButton+Border.h"

#import <Masonry/Masonry.h>

@interface TextFieldViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *button1;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    [self.view addSubview:self.button1];

//    UIButton *sender = [UIButton buttonWithType:UIButtonTypeSystem];
//    [sender setTitle:@"change" forState:UIControlStateNormal];
//    sender.frame = CGRectMake(0, 0, 60, 30);
//    [sender addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:sender];


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
 
    self.textField.frame = CGRectMake(20, 20, 300, 35);
    self.button.frame = CGRectMake(20, CGRectGetMaxY(self.textField.frame) + 20, 80, 35);
    self.button1.frame = CGRectMake(20, CGRectGetMaxY(self.button.frame) + 20, 80, 35);
    
//    [self.textField makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(10);
//        make.left.equalTo(self).offset(10);
//        make.right.equalTo(self).offset(-10);
//        make.height.equalTo(25);
//    }];
}

#pragma mark -funtions
- (void)handleAction:(UIButton *)sender{
    sender.selected = !sender.selected;
//    DDLog(@"isSelected_%@", @(sender.isSelected));
}


#pragma mark -lazy
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.placeholder = @"请输入";
        _textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];

        _textField.menuTarget.list = @[@"111", @"222", @"333", @"444", @"555"].mutableCopy;
        _textField.menuTarget.block = ^(NNTextFieldMenuTarget *tagget) {
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
            [sender setTitleColor:UIColor.systemGrayColor forState:UIControlStateNormal];
            [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateSelected];
            sender.titleLabel.font = [UIFont systemFontOfSize:15];
            
//            sender.titleLabel.adjustsFontSizeToFitWidth = YES;
            sender.imageView.contentMode = UIViewContentModeScaleAspectFit;
            sender;
        });
                
        _button.menuTarget.hiddenClearButton = true;
        _button.menuTarget.list = @[@"北京", @"上海", @"广州", @"深圳", @"西安"].mutableCopy;
        _button.menuTarget.block = ^(NNButtonMenuTarget *tagget) {
            DDLog(@"%@", tagget.selectedText);
        };
        
        [_button setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button setCornerRadius:4 forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIButton *)button1{
    if (!_button1) {
        _button1 = ({
            UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
            [sender setTitle:@"Normal" forState:UIControlStateNormal];
            [sender setTitle:@"Selected" forState:UIControlStateSelected];

            [sender setTitleColor:UIColor.systemGrayColor forState:UIControlStateNormal];
            [sender setTitleColor:UIColor.systemBlueColor forState:UIControlStateSelected];
            sender.titleLabel.font = [UIFont systemFontOfSize:15];
            
//            sender.titleLabel.adjustsFontSizeToFitWidth = YES;
            sender.imageView.contentMode = UIViewContentModeScaleAspectFit;
            sender;
        });
        
        [_button1 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button1 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button1 setCornerRadius:4 forState:UIControlStateNormal];
        [_button1 setCornerRadius:14 forState:UIControlStateSelected];

        [_button1 addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

@end
