//
//	NSDateIntervalFormatter+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:54
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSDateIntervalFormatter+Chain.h"

@implementation NSDateIntervalFormatter (Chain)

- (NSDateIntervalFormatter * (^)(NSLocale *))localeChain{
    return ^(NSLocale * value) {
        self.locale = value;
        return self;
    };
}

- (NSDateIntervalFormatter * (^)(NSCalendar *))calendarChain{
    return ^(NSCalendar * value) {
        self.calendar = value;
        return self;
    };
}

- (NSDateIntervalFormatter * (^)(NSTimeZone *))timeZoneChain{
    return ^(NSTimeZone * value) {
        self.timeZone = value;
        return self;
    };
}

- (NSDateIntervalFormatter * (^)(NSString *))dateTemplateChain{
    return ^(NSString * value) {
        self.dateTemplate = value;
        return self;
    };
}

- (NSDateIntervalFormatter * (^)(NSDateIntervalFormatterStyle))dateStyleChain{
    return ^(NSDateIntervalFormatterStyle value) {
        self.dateStyle = value;
        return self;
    };
}

- (NSDateIntervalFormatter * (^)(NSDateIntervalFormatterStyle))timeStyleChain{
    return ^(NSDateIntervalFormatterStyle value) {
        self.timeStyle = value;
        return self;
    };
}



@end
