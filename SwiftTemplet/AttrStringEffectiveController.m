//
//  AttrStringEffectiveController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/8.
//  Copyright © 2020 BN. All rights reserved.
//

#import "AttrStringEffectiveController.h"
#import <Masonry/Masonry.h>

#import "SwiftTemplet-Swift.h"

@interface AttrStringEffectiveController ()

@property(nonatomic, strong) UILabel *label;

@end

@implementation AttrStringEffectiveController

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
    }
    return _label;
}


#pragma mark -lazy
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    self.label.frame = CGRectMake(10, 10, kScreenWidth - 20, 100);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self effectiveRange];
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

@end
