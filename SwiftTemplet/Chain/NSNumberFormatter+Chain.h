//
//	NSNumberFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:57
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumberFormatter (Chain)

@property(nonatomic, copy, readonly, class) NSNumberFormatter *(^formattingContextChain)(NSFormattingContext) API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0)); // default is NSFormattingContextUnknown
@property(nonatomic, copy, readonly) NSNumberFormatter *(^numberStyleChain)(NSNumberFormatterStyle);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^localeChain)(NSLocale *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^generatesDecimalNumbersChain)(BOOL);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^formatterBehaviorChain)(NSNumberFormatterBehavior);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^negativeFormatChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForNegativeValuesChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^positiveFormatChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForPositiveValuesChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^allowsFloatsChain)(BOOL);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^decimalSeparatorChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^alwaysShowsDecimalSeparatorChain)(BOOL);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^currencyDecimalSeparatorChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^usesGroupingSeparatorChain)(BOOL);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^groupingSeparatorChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^zeroSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForZeroChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^nilSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForNilChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^notANumberSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForNotANumberChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^positiveInfinitySymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForPositiveInfinityChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^negativeInfinitySymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^textAttributesForNegativeInfinityChain)(NSDictionary<NSString *, id> *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^positivePrefixChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^positiveSuffixChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^negativePrefixChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^negativeSuffixChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^currencyCodeChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^currencySymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^internationalCurrencySymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^percentSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^perMillSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^minusSignChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^plusSignChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^exponentSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^groupingSizeChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^secondaryGroupingSizeChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^multiplierChain)(NSNumber *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^formatWidthChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^paddingCharacterChain)(NSString *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^paddingPositionChain)(NSNumberFormatterPadPosition);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^roundingModeChain)(NSNumberFormatterRoundingMode);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^roundingIncrementChain)(NSNumber *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^minimumIntegerDigitsChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^maximumIntegerDigitsChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^minimumFractionDigitsChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^maximumFractionDigitsChain)(NSUInteger);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^minimumChain)(NSNumber *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^maximumChain)(NSNumber *);

@property(nonatomic, copy, readonly) NSNumberFormatter *(^currencyGroupingSeparatorChain)(NSString *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSNumberFormatter *(^lenientChain)(BOOL) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSNumberFormatter *(^usesSignificantDigitsChain)(BOOL) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSNumberFormatter *(^minimumSignificantDigitsChain)(NSUInteger) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSNumberFormatter *(^maximumSignificantDigitsChain)(NSUInteger) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSNumberFormatter *(^partialStringValidationEnabledChain)(BOOL) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));


@end

NS_ASSUME_NONNULL_END
