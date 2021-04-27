//
//  ChainExampleController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

#import "ChainExampleController.h"
#import "NSDateFormatter+Chain.h"
#import "NSNumberFormatter+Chain.h"

#import "NSMutableParagraphStyle+Chain.h"
#import "NSMutableAttributedString+Chain.h"
#import "NSEnergyFormatter+Chain.h"
#import "NSPersonNameComponentsFormatter+Chain.h"
#import "NSByteCountFormatter+Chain.h"
#import "NSDateIntervalFormatter+Chain.h"


@interface ChainExampleController ()

@end

@implementation ChainExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    switch (4) {
        case 1:
            [self testPersonName];
            break;
        case 2:
            [self testByteCountFormatter];
            break;
        case 3:
            [self testNSMassFormatter];
            break;
        case 4:
            [self testNSLengthFormatter];
            break;
        case 5:
            [self testNSEnergyFormatter];
            break;
        default:
            [self testNSNumberFormatter];
            break;
    }
}


- (void)testNSNumberFormatter {
    NSNumber *num1 = [NSNumber numberWithDouble:1234567.8369];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    // ==================== 类方法 ====================
    // 四舍五入的整数
    NSString *noStyleStr                 = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterNoStyle];

    // 小数形式
    NSString *decimalStyleStr            = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterDecimalStyle];

    // 货币形式 -- 本地化
    NSString *currencyStyleStr           = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterCurrencyStyle];

    // 百分数形式
    NSString *percentStyleStr            = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterPercentStyle];

    // 科学计数
    NSString *scientificStyleStr         = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterScientificStyle];

    // 朗读形式 -- 本地化
    NSString *spellOutStyleStr           = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterSpellOutStyle];

    // 序数形式 -- 本地化
    NSString *ordinalStyleStr            = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterOrdinalStyle];

    // 货币形式 ISO -- 本地化
    NSString *currencyISOStyleStr        = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterCurrencyISOCodeStyle];

    // 货币形式 -- 本地化
    NSString *currencyPluralStyleStr     = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterCurrencyPluralStyle];

    // 会计计数 -- 本地化
    NSString *currencyAccountingStyleStr = [NSNumberFormatter localizedStringFromNumber:num1 numberStyle:NSNumberFormatterCurrencyAccountingStyle];

    NSLog(@"No Style= %@", noStyleStr);                // No Style = 1234568
    NSLog(@"Decimal Style= %@", decimalStyleStr);           // Decimal Style = 1,234,567.837
    NSLog(@"Currency Style = %@", currencyStyleStr);          // Currency Style = $1,234,567.84
    NSLog(@"Percent Style = %@", percentStyleStr);           // Percent Style = 123,456,784%
    NSLog(@"Scientific Style = %@", scientificStyleStr);        // Scientific Style = 1.2345678369E6
    // Spell Out Style = one million two hundred thirty-four thousand five hundred sixty-seven point eight three six nine
    NSLog(@"Spell Out Style = %@", spellOutStyleStr);
    NSLog(@"Ordinal Style = %@", ordinalStyleStr);            // Ordinal Style = 1,234,568th
    NSLog(@"Currency ISO Style = %@", currencyISOStyleStr);        // Currency ISO Style = USD1,234,567.84
    NSLog(@"Currency plural Style = %@", currencyPluralStyleStr);     // Currency plural Style = 1,234,567.84 US dollars
    NSLog(@"Currency accounting Style = %@", currencyAccountingStyleStr); // Currency accounting Style = $1,234,567.84

    // ==================== 定制 ====================
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    // 格式宽度
    numberFormatter.formatWidth = 15;
    // 填充符
    numberFormatter.paddingCharacter = @"?";
    // 填充位置
    numberFormatter.paddingPosition = kCFNumberFormatterPadBeforeSuffix;
    numberFormatter.positiveSuffix = @"元";
//    NSLog(@"%@",[numberFormatter numberFromString:@"10000000元"]);  // 10000000

    // 缩放因子,你可以将一个数缩放指定比例,然后给其添加后缀,如传入一个3000,你希望表示为3千,就要用到这个属性
    // 防止影响后面的测试,故注掉
    // numberFormatter.multiplier = @1000;
    // NSLog(@"%@千",[numberFormatter numberFromString:@"1000"]); // 1千
    // numberFormatter.multiplier = @0.001;
    // numberFormatter.positiveSuffix = @"千";
    // NSLog(@"%@",[numberFormatter stringFromNumber:@10000]); // 10千

    // 机制不明确,负号,正号
    // numberFormatter.negativeFormat = @"^";
    // numberFormatter.positiveFormat = @"~0";

    // 貌似没什么用
    numberFormatter.allowsFloats = NO;
    numberFormatter.alwaysShowsDecimalSeparator = NO;
    numberFormatter.maximum = @1000;
    numberFormatter.minimum = @100;
    // 小数点样式
    numberFormatter.decimalSeparator = @".";
    // 零的样式
    numberFormatter.zeroSymbol       = @"-";
    // 前缀和后缀
    numberFormatter.positivePrefix = @"!";
    numberFormatter.positiveSuffix = @"元";
    numberFormatter.negativePrefix = @"@";
    numberFormatter.negativeSuffix = @"亏";
    // 指定符号,与我们在前面类方法中说明的一致
    NSLog(@"货币代码%@",numberFormatter.currencyCode);                     // 货币代码USD
    NSLog(@"货币符号%@",numberFormatter.currencySymbol);                   // 货币符号$
    NSLog(@"国际货币符号%@",numberFormatter.internationalCurrencySymbol);   // 国际货币符号USD
    NSLog(@"百分比符号%@",numberFormatter.percentSymbol);                   // 百分比符号%
    NSLog(@"千分号符号%@",numberFormatter.perMillSymbol);                   // 千分号符号‰
    NSLog(@"减号符号%@",numberFormatter.minusSign);                         // 减号符号-
    NSLog(@"加号符号%@",numberFormatter.plusSign);                          // 加号符号+
    NSLog(@"指数符号%@",numberFormatter.exponentSymbol);                    // 指数符号E
     // 整数最多位数
    numberFormatter.maximumIntegerDigits = 10;
    // 整数最少位数
    numberFormatter.minimumIntegerDigits = 2;

    // 小数位最多位数
    numberFormatter.maximumFractionDigits = 3;

    // 小数位最少位数
    numberFormatter.minimumFractionDigits = 1;

    // 数字分割的尺寸
    numberFormatter.groupingSize = 4;

    // 除了groupingSize决定的尺寸外,其他数字位分割的尺寸
    numberFormatter.secondaryGroupingSize = 2;

    // 最大有效数字个数
    numberFormatter.maximumSignificantDigits = 12;

    // 最少有效数字个数
    numberFormatter.minimumSignificantDigits = 3;

    NSLog(@"正数%@,负数%@",[numberFormatter stringFromNumber:@(+12135230.2346)],[numberFormatter stringFromNumber:@(-12135231.2346)]);  // 正数!12,13,5230.2346元,负数@12,13,5231.2346亏
    NSLog(@"零 = %@",[numberFormatter stringFromNumber:@(0)]); // 零 = -
    // 舍入值,比如以10为进位值,那么156就进位为160,154进位为150
    numberFormatter.roundingIncrement = @10;
    // 舍入方式
    numberFormatter.roundingMode = kCFNumberFormatterRoundHalfUp;
    NSLog(@"%@",[numberFormatter stringFromNumber:@123456.7890]);  // !12,3460元
}

- (void)testPersonName {
    NSPersonNameComponentsFormatter *formatter = [[NSPersonNameComponentsFormatter alloc] init];
    formatter.style = NSPersonNameComponentsFormatterStyleLong;

    NSPersonNameComponents *p = [[NSPersonNameComponents alloc] init];
    p.givenName = @"三胖";
    p.familyName = @"金";
    p.nameSuffix = @"先生";
    p.namePrefix = @"朝鲜领导人";
    p.nickname = @"三胖子";
    p.middleName = @"-";
    NSString *outputString1 =[formatter stringFromPersonNameComponents:p];
    // 金三胖
    
    formatter.style = NSPersonNameComponentsFormatterStyleLong;
    NSString *outputString2 =[formatter stringFromPersonNameComponents:p];
    //朝鲜领导人金三胖 # 先生
    DDLog(@"%@", outputString1);
    DDLog(@"%@", outputString2);

    NSString *outputString3 = p.givenNameChain(@"Three fat")
        .familyNameChain(@"gold")
        .nameSuffixChain(@"Sir")
        .namePrefixChain(@"North Korean leaders")
        .nicknameChain(@"Troisgros")
        .middleNameChain(@"-")
    .stringByChain(formatter);
    DDLog(@"%@", outputString3);
    
//    NSPersonNameComponents *p1 = [[NSPersonNameComponents alloc] init];
//    p.givenName = @"Three fat";
//    p.familyName = @"gold";
//    p.nameSuffix = @"Sir";
//    p.namePrefix = @"North Korean leaders";
//    p.nickname = @"Troisgros";
//    p.middleName = @"#";
//    NSString *outputString11 =[formatter stringFromPersonNameComponents:p1];
//    // Kim Sanfat
//
//    formatter.style = NSPersonNameComponentsFormatterStyleLong;
//    NSString *outputString12 =[formatter stringFromPersonNameComponents:p1];
//    //North Korean leader Kim Sang-fat # Sir
//    NSLog(@"%@", outputString11);
//    NSLog(@"%@", outputString12);
    
//    NSAttributedString *att = [formatter annotatedStringFromPersonNameComponents:p];
//    NSLog(@"%@", att);

}

- (void)testByteCountFormatter {
    NSByteCountFormatter *format = [[NSByteCountFormatter alloc] init];
    format.allowedUnits = NSByteCountFormatterUseMB; //以MB输出
    format.countStyle = NSByteCountFormatterCountStyleBinary;//1024字节为1KB
    format.includesUnit =  YES; /// 输出结果显示单位
    format.includesCount = YES;  /// 输出结果显示数据
    NSString *str = [format stringFromByteCount:4577781312988388823];
    NSLog(@" %@ ",str);
    
}

- (void)testNSMassFormatter {
    NSMassFormatter *formatter = [[NSMassFormatter alloc] init];
 // [formatter.numberFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh"]];
   formatter.unitStyle = NSFormattingUnitStyleLong;
   NSString *outputString1 = [formatter stringFromValue:200 unit:NSMassFormatterUnitGram];
   /// 输出 200克
   NSString *outputString2 = [formatter stringFromKilograms:200];
   /// 输出 200千克
    NSString *outputString3 = [formatter unitStringFromValue:33333.2 unit:NSMassFormatterUnitKilogram];
   /// 输出 kilograms
   NSMassFormatterUnit uko = NSMassFormatterUnitKilogram;
   NSString *outputString4 = [formatter unitStringFromKilograms:200 usedUnit:&uko];
    /// 输出 kilograms
    DDLog(@"outputString: %@", @[outputString1, outputString2, outputString3, outputString4]);
}

- (void)testNSLengthFormatter {
    NSLengthFormatter  *formatter = [[NSLengthFormatter alloc] init];
    formatter.unitStyle = NSFormattingUnitStyleLong;
    NSString *outputString1 = [formatter stringFromValue:200 unit:NSLengthFormatterUnitMeter];
    /// 输出 200克
    NSString *outputString2 = [formatter stringFromMeters:222];
    /// 输出 200千克
    NSString *outputString3 = [formatter unitStringFromValue:33333.2 unit:NSLengthFormatterUnitMeter];
    /// 输出 kilograms
    NSLengthFormatterUnit uko = NSLengthFormatterUnitMeter;
    NSString *outputString4 = [formatter unitStringFromMeters:222 usedUnit:&uko];
    /// 输出 kilograms
    DDLog(@"outputString: %@", @[outputString1, outputString2, outputString3, outputString4]);
}

- (void)testNSEnergyFormatter {
    NSEnergyFormatter *formatter = [[NSEnergyFormatter alloc] init];
    formatter.forFoodEnergyUse = YES;
    double value = 1000.0;
    NSString *outputString = [formatter stringFromJoules:value];
    DDLog(@"outputString: %@", outputString);
}



@end
