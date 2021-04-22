//
//	NSDateIntervalFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:54
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateIntervalFormatter (Chain)

@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^localeChain)(NSLocale *);
 // default is [NSLocale currentLocale]
@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^calendarChain)(NSCalendar *);
 // default is the calendar of the locale
@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^timeZoneChain)(NSTimeZone *);
 // default is [NSTimeZone defaultTimeZone]
@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^dateTemplateChain)(NSString *);
 // default is an empty string
@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^dateStyleChain)(NSDateIntervalFormatterStyle);
 // default is NSDateIntervalFormatterNoStyle
@property(nonatomic, copy, readonly) NSDateIntervalFormatter *(^timeStyleChain)(NSDateIntervalFormatterStyle);
 // default is NSDateIntervalFormatterNoStyle


@end

NS_ASSUME_NONNULL_END
