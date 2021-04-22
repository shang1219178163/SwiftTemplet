//
//  NSDateFormatter+Chain.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

#import "NSDateFormatter+Chain.h"

@implementation NSDateFormatter (Chain)

- (NSDateFormatter * (^)(NSFormattingContext))formattingContextChain{
    return ^(NSFormattingContext value) {
        self.formattingContext = value;
        return self;
    };
}

+ (NSDateFormatter * (^)(NSDateFormatterBehavior))defaultFormatterBehaviorChain{
    return ^(NSDateFormatterBehavior value) {
        self.defaultFormatterBehavior = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSString *))dateFormatChain{
    return ^(NSString * value) {
        self.dateFormat = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDateFormatterStyle))dateStyleChain{
    return ^(NSDateFormatterStyle value) {
        self.dateStyle = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDateFormatterStyle))timeStyleChain{
    return ^(NSDateFormatterStyle value) {
        self.timeStyle = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSLocale *))localeChain{
    return ^(NSLocale * value) {
        self.locale = value;
        return self;
    };
}

- (NSDateFormatter * (^)(BOOL))generatesCalendarDatesChain{
    return ^(BOOL value) {
        self.generatesCalendarDates = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDateFormatterBehavior))formatterBehaviorChain{
    return ^(NSDateFormatterBehavior value) {
        self.formatterBehavior = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSTimeZone *))timeZoneChain{
    return ^(NSTimeZone * value) {
        self.timeZone = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSCalendar *))calendarChain{
    return ^(NSCalendar * value) {
        self.calendar = value;
        return self;
    };
}

- (NSDateFormatter * (^)(BOOL))lenientChain{
    return ^(BOOL value) {
        self.lenient = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDate *))twoDigitStartDateChain{
    return ^(NSDate * value) {
        self.twoDigitStartDate = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDate *))defaultDateChain{
    return ^(NSDate * value) {
        self.defaultDate = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))eraSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.eraSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))monthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.monthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortMonthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortMonthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))weekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.weekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortWeekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortWeekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSString *))AMSymbolChain{
    return ^(NSString * value) {
        self.AMSymbol = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSString *))PMSymbolChain{
    return ^(NSString * value) {
        self.PMSymbol = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))longEraSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.longEraSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))veryShortMonthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.veryShortMonthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))standaloneMonthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.standaloneMonthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortStandaloneMonthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortStandaloneMonthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))veryShortStandaloneMonthSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.veryShortStandaloneMonthSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))veryShortWeekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.veryShortWeekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))standaloneWeekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.standaloneWeekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortStandaloneWeekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortStandaloneWeekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))veryShortStandaloneWeekdaySymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.veryShortStandaloneWeekdaySymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))quarterSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.quarterSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortQuarterSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortQuarterSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))standaloneQuarterSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.standaloneQuarterSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSArray<NSString *> *))shortStandaloneQuarterSymbolsChain{
    return ^(NSArray<NSString *> * value) {
        self.shortStandaloneQuarterSymbols = value;
        return self;
    };
}

- (NSDateFormatter * (^)(NSDate *))gregorianStartDateChain{
    return ^(NSDate * value) {
        self.gregorianStartDate = value;
        return self;
    };
}

@end

