//
//  PasswordStrengthCheckController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

#import "PasswordStrengthCheckController.h"

@interface PasswordStrengthCheckController ()

@end

@implementation PasswordStrengthCheckController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    NSString *a = @"12345678q";
    NSString *b = @"12345678Q";
    NSString *c = @"12345678qQ";
    NSString *d = @"12345678qQ.";

    NSNumber *a1 = [self checkPassWordNew:a];
    NSNumber *b1 = [self checkPassWordNew:b];
    NSNumber *c1 = [self checkPassWordNew:c];
    NSNumber *d1 = [self checkPassWordNew:d];
    DDLog(@"a1: %@", a1);
    DDLog(@"b1: %@", b1);
    DDLog(@"c1: %@", c1);
    DDLog(@"d1: %@", d1);
}

-(BOOL)checkPassWord:(NSString *)passWord{
    NSString *passWordRegex = @"=^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-+/()_. ]).{8,16}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];
    if (![passWordPredicate evaluateWithObject:passWord]) {
        return false;
    }

    NSInteger index = 0;
    passWordRegex = @".*[0-9]+.*";
    passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    if ([passWordPredicate evaluateWithObject:passWord]) {
        index ++;
    }

    passWordRegex = @".*[a-z]+.*";
    passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];
    if ([passWordPredicate evaluateWithObject:passWord]) {
        index ++;
    }

    passWordRegex = @".*[A-Z]+.*";
    passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    if ([passWordPredicate evaluateWithObject:passWord]) {
        index ++;
    }

    passWordRegex = @".*[\\x21-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7B-\\x7F]+.*";
    passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    if ([passWordPredicate evaluateWithObject:passWord]) {
        index ++;
    }
        
    if (index >= 3) {
        return YES;
    }
    return false;
}

/// 密码检测 0 - 无效密码, 1 - low, 2 - mid, 3 -high
-(NSNumber *)checkPassWordOne:(NSString *)passWord{
//    NSString *leveLowRegex = @"^(?=.\\d)(?=.[a-zA-Z]).{8,16}$";
//    NSString *leveMidRegex = @"^(?=.[a-z])(?=.[A-Z])(?=.*\\d)[a-zA-Z0-9]{8,16}$";
//    NSString *leveHeighRegex = @"^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-+/()_. ]).{8,16}$";
    NSString *leveLowRegex = @"(?![0-9A-Z]+$)(?![0-9a-z]+$)(?![a-zA-Z]+$)[0-9A-Za-z].{8,16}$";
    NSString *leveMidRegex = @"^(?=.[a-z])(?=.[A-Z])(?=.*\\d)[a-zA-Z0-9]{8,16}$";
    NSString *leveHeighRegex = @"^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[#?!@$%^&*-+/()_. ]).{8,16}$";
    
    NSPredicate *leveLowPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", leveLowRegex];
    NSPredicate *leveMidPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", leveMidRegex];
    NSPredicate *leveHeighPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", leveHeighRegex];

    bool isLeveLow = [leveLowPredicate evaluateWithObject:passWord];
    bool isLeveMid = [leveMidPredicate evaluateWithObject:passWord];
    bool isLeveHeigh = [leveHeighPredicate evaluateWithObject:passWord];
    
    if (isLeveLow) {
        return @(1);
    }
    
    if (isLeveMid) {
        return @(2);
    }
    
    if (isLeveHeigh) {
        return @(3);
    }
    return @(0);
}


/// 密码强度检测
/// @param passWord  0,1 不合格, 2 - low, 3 - mid, 4 -high
-(NSNumber *)checkPassWordNew:(NSString *)passWord{
    NSString *regex = @"^(?=.\\d)(?=.[a-zA-Z0-9]).{8,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:passWord]) {
        return @(0);
    }

    NSInteger index = 0;
    regex = @".*[0-9]+.*";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:passWord]) {
        index ++;
    }

    regex = @".*[a-z]+.*";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:passWord]) {
        index ++;
    }

    regex = @".*[A-Z]+.*";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:passWord]) {
        index ++;
    }

    regex = @".*[\\x21-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7B-\\x7F]+.*";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:passWord]) {
        index ++;
    }
    return @(index);
}

@end
