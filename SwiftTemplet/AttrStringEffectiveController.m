//
//  AttrStringEffectiveController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/8.
//  Copyright © 2020 BN. All rights reserved.
//

#import "AttrStringEffectiveController.h"
#import <Masonry/Masonry.h>
#import "NSMutableAttributedString+Chain.h"
#import <SwiftExpand/SwiftExpand-Swift.h>

#import "SwiftTemplet-Swift.h"

@interface AttrStringEffectiveController ()

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) NSTimer *socketTimer;

@end

@implementation AttrStringEffectiveController


#pragma mark -lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    self.label.frame = CGRectMake(10, 10, UIScreen.sizeWidth - 20, 300);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self effectiveRange];
    [self testFuntion];
    
    NSURL *url = [NSURL URLWithString:@"https://github.com/search?q=appendingQueryParameters"];
    url = [url appendingQueryParameters:@{@"token": @"111"}];
    DDLog(@"url: %@", url.absoluteString);
    
//    self.socketTimer = [NSTimer scheduled:5 repeats:true action:^(NSTimer *timer) {
//        DDLog(@"timer: _%@_%f_", timer.fireDate, timer.timeInterval);
//    }];
    
    NSDictionary *dic = @{};
    NSString *url1 = dic[@"date"][@"url"];
    DDLog(@"url: %@", url1);
    
    NSAttributedString *att = [[NSAttributedString alloc]initWithString:@"摘要：iOS 客户端应用架构看似简单，但实际上要考虑的事情不少。本文作者将以系列文章的形式来回答 iOS 应用架构中的种种问题，本文是其中的第一篇，主要讲架构设计的通识和方法论等，同时还讨论了大家关心的架构分层、是否要有 common 文件夹等问题。"];
    DDLog(@"size:%@", @(att.size));
    CGSize size = [att sizeWith:300];
    DDLog(@"size:%@", @(size));
    
    
//    NSAttributedString *attPrefix = [[NSAttributedString alloc]initWithString:@"*"
//                                                                    attributes: @{NSForegroundColorAttributeName: UIColor.redColor}];
//
//    NSMutableAttributedString *matt = [[NSMutableAttributedString alloc]initWithAttributedString:attPrefix];
//    [matt appendAttributedString:att];
    
    NSAttributedString *attPrefix = [[NSAttributedString alloc]initWithString:@"*"
                                                                    attributes: @{NSForegroundColorAttributeName: UIColor.redColor}];

    NSMutableAttributedString *matt = [[NSMutableAttributedString alloc]initWithAttributedString:att];
    [matt insertAttributedString:attPrefix atIndex:0];
    
    self.label.attributedText = matt;
}

- (void)effectiveRange {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"BoBiBu"];

    [attString addAttribute:NSBackgroundColorAttributeName
                             value:[UIColor systemGreenColor]
                             range:NSMakeRange(0, 2)];
    
    [attString addAttribute:NSFontAttributeName
                             value:[UIFont boldSystemFontOfSize:12]
                             range:NSMakeRange(0, 2)];
    
    [attString addAttribute:NSFontAttributeName
                             value:[UIFont italicSystemFontOfSize:12]
                             range:NSMakeRange(2, 2)];
    
    [attString addAttribute:NSBackgroundColorAttributeName
                             value:[UIColor systemRedColor]
                             range:NSMakeRange(2, 2)];
    NSLog(@"AttributedString: %@", attString);


//    NSRange range1;
//    NSLog(@"Attribute: %@", [attString attribute:NSBackgroundColorAttributeName atIndex:0 effectiveRange:&range1]);
//    NSLog(@"EffectiveRange of previous attribute: %@", NSStringFromRange(range1));
//    NSLog(@"attributedSubstringFromRange: %@", [attString attributedSubstringFromRange:range1]);
//
//    NSRange range2;
//    NSLog(@"Attribute: %@", [attString attribute:NSBackgroundColorAttributeName atIndex:0 longestEffectiveRange:&range2 inRange:NSMakeRange(0, 6)]);
//    NSLog(@"Longest effective Range of previous attribute: %@", NSStringFromRange(range2));
//    NSLog(@"attributedSubstringFromRange: %@", [attString attributedSubstringFromRange:range2]);
    
    NSRange range10;
    NSDictionary *dic10 = [attString attributesAtIndex:0 effectiveRange:&range10];
    NSRange range11;
    NSDictionary *dic11 = [attString attributesAtIndex:1 effectiveRange:&range11];
    NSRange range12;
    NSDictionary *dic12 = [attString attributesAtIndex:2 effectiveRange:&range12];
    NSLog(@"attributes10: %@, %@", NSStringFromRange(range10), dic10);
    NSLog(@"attributes11: %@, %@", NSStringFromRange(range11), dic11);
    NSLog(@"attributes12: %@, %@", NSStringFromRange(range12), dic12);

    self.label.attributedText = attString;
    
//    [attString enumerateAttributesInRange:NSMakeRange(0, attString.length)
//                                  options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
//                               usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
//        DDLog(@"%@\n%@", NSStringFromRange(range), attrs);
//    }];
        
//    NSDictionary<NSString *, NSDictionary<NSAttributedStringKey, id> *> *dic = attString.rangeAttributes;
//    DDLog(@"%@", dic);
    
//    [dic.allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"attributedSubstring: %@", [attString attributedSubstringFromRange:NSRangeFromString(obj)]);
//    }];
    
    
    NSDictionary<NSString *, NSAttributedString *> *dic = attString.rangeSubAttStringDic;
    NSArray *allKeys = [dic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    DDLog(@"compare_%@", allKeys);
    DDLog(@"dic: %@", dic);
    
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSAttributedString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSAttributedString *subAttString = [attString attributedSubstringFromRange:NSRangeFromString(key)];
        NSLog(@"attributedSubstring: %@", subAttString);
    }];
}

- (void)testFuntion {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"BoBiBu"];
    
    
//    NSMutableDictionary *mdic = @{
//        @"1": @"111",
//        @"2": @"222",
//        @"3": @"333",
//    }.mutableCopy;
////    [mdic setObject:nil forKey:@"1"];
//    DDLog(@"mdc: %@", mdic);
//
//
//    [mdic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        DDLog(@"%@: %@", key, obj);
//    }];
//
//    [mdic enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        DDLog(@"_%@: %@", key, obj);
//    }];
    
    
//    UIStackView *sender = [[UIStackView alloc]initWithArrangedSubviews:@[]
//                                                                  axis:UILayoutConstraintAxisVertical
//                                                               spacing:5
//                                                             alignment:UIStackViewAlignmentFill
//                                                          distribution:UIStackViewDistributionFill];
}


#pragma mark -lifecycle
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
