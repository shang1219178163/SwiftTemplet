//
//	NSNumberFormatter+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:57
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSNumberFormatter+Chain.h"

@implementation NSNumberFormatter (Chain)

+ (NSNumberFormatter * (^)(NSFormattingContext))defaultFormatterBehaviorChain{
    return ^(NSFormattingContext value) {
        self.defaultFormatterBehavior = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumberFormatterStyle))numberStyleChain{
    return ^(NSNumberFormatterStyle value) {
        self.numberStyle = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSLocale *))localeChain{
    return ^(NSLocale * value) {
        self.locale = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))generatesDecimalNumbersChain{
    return ^(BOOL value) {
        self.generatesDecimalNumbers = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumberFormatterBehavior))formatterBehaviorChain{
    return ^(NSNumberFormatterBehavior value) {
        self.formatterBehavior = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))negativeFormatChain{
    return ^(NSString * value) {
        self.negativeFormat = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForNegativeValuesChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForNegativeValues = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))positiveFormatChain{
    return ^(NSString * value) {
        self.positiveFormat = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForPositiveValuesChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForPositiveValues = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))allowsFloatsChain{
    return ^(BOOL value) {
        self.allowsFloats = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))decimalSeparatorChain{
    return ^(NSString * value) {
        self.decimalSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))alwaysShowsDecimalSeparatorChain{
    return ^(BOOL value) {
        self.alwaysShowsDecimalSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))currencyDecimalSeparatorChain{
    return ^(NSString * value) {
        self.currencyDecimalSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))usesGroupingSeparatorChain{
    return ^(BOOL value) {
        self.usesGroupingSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))groupingSeparatorChain{
    return ^(NSString * value) {
        self.groupingSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))zeroSymbolChain{
    return ^(NSString * value) {
        self.zeroSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForZeroChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForZero = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString * _Nonnull))nilSymbolChain{
    return ^(NSString * value) {
        self.nilSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForNilChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForNil = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))notANumberSymbolChain{
    return ^(NSString * value) {
        self.notANumberSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForNotANumberChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForNotANumber = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString * _Nonnull))positiveInfinitySymbolChain{
    return ^(NSString * value) {
        self.positiveInfinitySymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForPositiveInfinityChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForPositiveInfinity = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString * _Nonnull))negativeInfinitySymbolChain{
    return ^(NSString * value) {
        self.negativeInfinitySymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSDictionary<NSString *, id> *))textAttributesForNegativeInfinityChain{
    return ^(NSDictionary<NSString *, id> * value) {
        self.textAttributesForNegativeInfinity = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))positivePrefixChain{
    return ^(NSString * value) {
        self.positivePrefix = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))positiveSuffixChain{
    return ^(NSString * value) {
        self.positiveSuffix = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))negativePrefixChain{
    return ^(NSString * value) {
        self.negativePrefix = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))negativeSuffixChain{
    return ^(NSString * value) {
        self.negativeSuffix = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))currencyCodeChain{
    return ^(NSString * value) {
        self.currencyCode = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))currencySymbolChain{
    return ^(NSString * value) {
        self.currencySymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))internationalCurrencySymbolChain{
    return ^(NSString * value) {
        self.internationalCurrencySymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))percentSymbolChain{
    return ^(NSString * value) {
        self.percentSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))perMillSymbolChain{
    return ^(NSString * value) {
        self.perMillSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))minusSignChain{
    return ^(NSString * value) {
        self.minusSign = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))plusSignChain{
    return ^(NSString * value) {
        self.plusSign = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))exponentSymbolChain{
    return ^(NSString * value) {
        self.exponentSymbol = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))groupingSizeChain{
    return ^(NSUInteger value) {
        self.groupingSize = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))secondaryGroupingSizeChain{
    return ^(NSUInteger value) {
        self.secondaryGroupingSize = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumber *))multiplierChain{
    return ^(NSNumber * value) {
        self.multiplier = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))formatWidthChain{
    return ^(NSUInteger value) {
        self.formatWidth = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))paddingCharacterChain{
    return ^(NSString * value) {
        self.paddingCharacter = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumberFormatterPadPosition))paddingPositionChain{
    return ^(NSNumberFormatterPadPosition value) {
        self.paddingPosition = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumberFormatterRoundingMode))roundingModeChain{
    return ^(NSNumberFormatterRoundingMode value) {
        self.roundingMode = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumber *))roundingIncrementChain{
    return ^(NSNumber * value) {
        self.roundingIncrement = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))minimumIntegerDigitsChain{
    return ^(NSUInteger value) {
        self.minimumIntegerDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))maximumIntegerDigitsChain{
    return ^(NSUInteger value) {
        self.maximumIntegerDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))minimumFractionDigitsChain{
    return ^(NSUInteger value) {
        self.minimumFractionDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))maximumFractionDigitsChain{
    return ^(NSUInteger value) {
        self.maximumFractionDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumber *))minimumChain{
    return ^(NSNumber * value) {
        self.minimum = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSNumber *))maximumChain{
    return ^(NSNumber * value) {
        self.maximum = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSString *))currencyGroupingSeparatorChain{
    return ^(NSString * value) {
        self.currencyGroupingSeparator = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))lenientChain{
    return ^(BOOL value) {
        self.lenient = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))usesSignificantDigitsChain{
    return ^(BOOL value) {
        self.usesSignificantDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))minimumSignificantDigitsChain{
    return ^(NSUInteger value) {
        self.minimumSignificantDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(NSUInteger))maximumSignificantDigitsChain{
    return ^(NSUInteger value) {
        self.maximumSignificantDigits = value;
        return self;
    };
}

- (NSNumberFormatter * (^)(BOOL))partialStringValidationEnabledChain{
    return ^(BOOL value) {
        self.partialStringValidationEnabled = value;
        return self;
    };
}


@end
