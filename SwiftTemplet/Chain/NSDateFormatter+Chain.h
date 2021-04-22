//
//  NSDateFormatter+Chain.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (Chain)

@property(nonatomic, copy, readonly) NSDateFormatter *(^formattingContextChain)(NSFormattingContext) API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));; // default is NSFormattingContextUnknown

@property(nonatomic, copy, readonly, class) NSDateFormatter *(^defaultFormatterBehaviorChain)(NSDateFormatterBehavior);

@property(nonatomic, copy, readonly) NSDateFormatter *(^dateFormatChain)(NSString *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^dateStyleChain)(NSDateFormatterStyle);

@property(nonatomic, copy, readonly) NSDateFormatter *(^timeStyleChain)(NSDateFormatterStyle);

@property(nonatomic, copy, readonly) NSDateFormatter *(^localeChain)(NSLocale *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^generatesCalendarDatesChain)(BOOL);

@property(nonatomic, copy, readonly) NSDateFormatter *(^formatterBehaviorChain)(NSDateFormatterBehavior);

@property(nonatomic, copy, readonly) NSDateFormatter *(^timeZoneChain)(NSTimeZone *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^calendarChain)(NSCalendar *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^lenientChain)(BOOL);

@property(nonatomic, copy, readonly) NSDateFormatter *(^twoDigitStartDateChain)(NSDate *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^defaultDateChain)(NSDate *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^eraSymbolsChain)(NSArray<NSString *> *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^monthSymbolsChain)(NSArray<NSString *> *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^shortMonthSymbolsChain)(NSArray<NSString *> *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^weekdaySymbolsChain)(NSArray<NSString *> *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^shortWeekdaySymbolsChain)(NSArray<NSString *> *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^AMSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^PMSymbolChain)(NSString *);

@property(nonatomic, copy, readonly) NSDateFormatter *(^longEraSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^veryShortMonthSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^standaloneMonthSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^shortStandaloneMonthSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^veryShortStandaloneMonthSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^veryShortWeekdaySymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^standaloneWeekdaySymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^shortStandaloneWeekdaySymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^veryShortStandaloneWeekdaySymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^quarterSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^shortQuarterSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^standaloneQuarterSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^shortStandaloneQuarterSymbolsChain)(NSArray<NSString *> *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^gregorianStartDateChain)(NSDate *) API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
@property(nonatomic, copy, readonly) NSDateFormatter *(^idChain)(id) API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));


@end

NS_ASSUME_NONNULL_END
