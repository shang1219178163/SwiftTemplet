//
//  NNButtonDispalyController.m
//  ProductTemplet
//
//  Created by Bin Shang on 2021/1/21.
//  Copyright © 2021 BN. All rights reserved.
//

#import "NNButtonDispalyController.h"
#import "NNButton.h"
#import "UIButton+BorderColor.h"

@interface NNButtonDispalyController ()

@property (nonatomic, strong) NNButton *button;
@property (nonatomic, strong) NNButton *button1;
@property (nonatomic, strong) NNButton *button2;
@property (nonatomic, strong) NNButton *button3;
@property (nonatomic, strong) NNButton *button4;
@property (nonatomic, strong) NNButton *button5;

@end

@implementation NNButtonDispalyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.button];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    [self.view addSubview:self.button4];
    [self.view addSubview:self.button5];

//    NSDictionary *dic = @{
//        @"UIControlStateNormal": @(UIControlStateNormal),
//        @"UIControlStateHighlighted": @(UIControlStateHighlighted),
//        @"UIControlStateDisabled": @(UIControlStateDisabled),
//        @"UIControlStateSelected": @(UIControlStateSelected),
//        @"UIControlStateFocused": @(UIControlStateFocused),
//        @"UIControlStateApplication": @(UIControlStateApplication),
//        @"UIControlStateReserved": @(UIControlStateReserved),
//
//    };
//    DDLog(@"dic: %@", dic);
    
//    [self.view getViewLayer];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
 
    self.button.frame = CGRectMake(20, 20, 100, 35);
    self.button1.frame = CGRectMake(20, CGRectGetMaxY(self.button.frame) + 20, 100, 35*2);
    self.button2.frame = CGRectMake(20, CGRectGetMaxY(self.button1.frame) + 20, 100, 35);
    self.button3.frame = CGRectMake(20, CGRectGetMaxY(self.button2.frame) + 20, 100, 35*2);
    self.button4.frame = CGRectMake(20, CGRectGetMaxY(self.button3.frame) + 20, 100, 35);
    self.button5.frame = CGRectMake(20, CGRectGetMaxY(self.button4.frame) + 20, 75, 75);

}

#pragma mark -funtions

- (void)handleActionChoose:(NNButton *)sender {
    sender.selected = !sender.isSelected;
//    DDLog(@"sender.isSelected: %@", @(sender.isSelected));
//    DDLog(@"name: %@ %@", @(sender.tag), @(sender.iconBtn.tag));
}

- (void)handleActionDelete:(UIButton *)sender {
    DDLog(@"sender %@", sender);
}

#pragma mark -lazy
- (NNButton *)button{
    if (!_button) {
        _button = ({
            NNButton *view = [[NNButton alloc]initWithFrame:CGRectZero];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.titleLabel.textAlignment = NSTextAlignmentLeft;

            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];
    
            view.tag = 100;
            view;
        });
        
//        _button.layer.borderWidth = 1;
//        _button.layer.cornerRadius = 4;
        
//        [_button setBorderWidth:1 forState:UIControlStateNormal];
//        [_button setBorderWidth:3 forState:UIControlStateSelected];
//        [_button setBorderWidth:6 forState:UIControlStateHighlighted];
        
        [_button setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button setBorderColor:UIColor.systemRedColor forState:UIControlStateHighlighted];
        [_button setCornerRadius:4 forState:UIControlStateNormal];
//        [_button setCornerRadius:8 forState:UIControlStateSelected];
//        [_button setCornerRadius:12 forState:UIControlStateHighlighted];
    }
    return _button;
}

- (NNButton *)button1{
    if (!_button1) {
        _button1 = ({
            NNButton *view = [NNButton buttonWithType:UIButtonTypeCustom];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];

            view;
        });
        
//        _button1.layer.borderWidth = 1;
        [_button1 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button1 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button1 setCornerRadius:4 forState:UIControlStateNormal];
        [_button1 setCornerRadius:14 forState:UIControlStateSelected];

        _button1.direction = NNButtonDirectionTop;
        _button1.iconLocation = NNButtonLocationNone;
    }
    return _button1;
}

- (NNButton *)button2{
    if (!_button2) {
        _button2 = ({
            NNButton *view = [[NNButton alloc]initWithFrame:CGRectZero];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];

            view;
        });
        
        [_button2 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button2 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button2 setCornerRadius:4 forState:UIControlStateNormal];

        _button2.direction = NNButtonDirectionLeft;
        _button2.iconLocation = NNButtonLocationNone;
    }
    return _button2;
}

- (NNButton *)button3{
    if (!_button3) {
        _button3 = ({
            NNButton *view = [[NNButton alloc]initWithFrame:CGRectZero];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];

            view;
        });
        
        [_button3 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button3 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button3 setCornerRadius:4 forState:UIControlStateNormal];

        _button3.direction = NNButtonDirectionBom;
        _button3.iconLocation = NNButtonLocationNone;
    }
    return _button3;
}

- (NNButton *)button4{
    if (!_button4) {
        _button4 = ({
            NNButton *view = [[NNButton alloc]initWithFrame:CGRectZero];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];

            view;
        });
        
        [_button4 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button4 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button4 setCornerRadius:4 forState:UIControlStateNormal];

        _button4.direction = NNButtonDirectionRight;
        _button4.iconLocation = NNButtonLocationNone;
    }
    return _button4;
}

- (NNButton *)button5{
    if (!_button5) {
        _button5 = ({
            NNButton *view = [[NNButton alloc]initWithFrame:CGRectZero];
            [view setTitle:@"Button" forState:UIControlStateNormal];
            view.titleLabel.adjustsFontSizeToFitWidth = YES;
            view.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view setImage:[UIImage imageNamed:@"icon_selected_no_default"] forState:UIControlStateNormal];
            [view setImage:[UIImage imageNamed:@"icon_selected_yes_green"] forState:UIControlStateSelected];
            [view addTarget:self action:@selector(handleActionChoose:) forControlEvents:UIControlEventTouchUpInside];

            view;
        });
        
        [_button5 setBorderColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_button5 setBorderColor:UIColor.systemBlueColor forState:UIControlStateSelected];
        [_button5 setCornerRadius:4 forState:UIControlStateNormal];

        _button5.direction = NNButtonDirectionNone;
        _button5.iconLocation = NNButtonLocationNone;
        
        _button5.titleLabel.hidden = true;
        _button5.iconLocation = NNButtonLocationRightTop;
        _button5.iconSize = CGSizeMake(20, 20);
        _button5.iconOffset = UIOffsetMake(8, -8);
        _button5.eventInsetDX = 8;
        _button5.eventInsetDY = 8;
        [_button5.iconBtn setBackgroundImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
        [_button5.iconBtn addTarget:self action:@selector(handleActionDelete:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _button5;
}

@end
