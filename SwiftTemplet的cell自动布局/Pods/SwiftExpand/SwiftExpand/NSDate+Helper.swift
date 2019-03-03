//
//  Date+Helper.swift
//  SwiftTemplet
//
//  Created by dev on 2018/12/11.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public let kDate_minute : Double = 60 ;
public let kDate_hour : Double   = 3600 ;
public let kDate_day : Double    = 86400 ;
public let kDate_week : Double   = 604800 ;
public let kDate_year : Double   = 31556926 ;


/// yyyy-MM-dd HH:mm:ss(默认)
public let kDateFormat       = "yyyy-MM-dd HH:mm:ss";
/// yyyy-MM-dd
public let kDateFormat_one   = "yyyy-MM-dd";
/// yyyyMMdd
public let kDateFormat_two   = "yyyyMMdd";
/// yyyy-MM
public let kDateFormat_three = "yyyy-MM";
/// yyyy-MM-dd HH:mm:ss eee
public let kDateFormat_four  = "yyyy-MM-dd HH:mm:ss eee";
/// yyyy年MM月
public let kDateFormat_five  = "";
/// yyyy年M月
public let kDateFormat_Six   = "yyyy年MM月";
/// yyyy年MM月dd日
public let kDateFormat_seven = "yyyy年MM月dd日";

/*
G: 公元时代，例如AD公元
yy: 年的后2位
yyyy: 完整年
MM: 月，显示为1-12
MMM: 月，显示为英文月份简写,如 Jan
MMMM: 月，显示为英文月份全称，如 Janualy
dd: 日，2位数表示，如02
d: 日，1-2位显示，如 2
EEE: 简写星期几，如Sun
EEEE: 全写星期几，如Sunday
aa: 上下午，AM/PM
H: 时，24小时制，0-23
K：时，12小时制，0-11
m: 分，1-2位
mm: 分，2位
s: 秒，1-2位
ss: 秒，2位
S: 毫秒
*/

public extension DateFormatter{
    
    /// 获取DateFormatter
    public static func format(_ formatStr:String) -> DateFormatter {
        let dic = Thread.current.threadDictionary;
        if dic.object(forKey: formatStr) != nil {
            return dic.object(forKey: formatStr) as! DateFormatter;
        }
        
        let fmt = DateFormatter();
        fmt.dateFormat = formatStr;
        fmt.locale = .current;
        fmt.locale = Locale(identifier: "zh_CN");

        fmt.timeZone = NSTimeZone.local;
        dic.setObject(fmt, forKey: formatStr as NSCopying)
        return fmt;
    }
    
    /// Date -> String
    public static func stringFromDate(_ date:Date, fmt:String) -> String {
        let formatter = DateFormatter.format(fmt);
        return formatter.string(from: date);
    }
    
    /// Date -> String(默认格式)
    public static func stringFromDate(_ date:Date) -> String {
        return DateFormatter.stringFromDate(date, fmt: kDateFormat);
    }
    
    /// String -> Date
    public static func dateFromString(_ dateStr:String, fmt:String) -> Date {
        let formatter = DateFormatter.format(fmt);
        return formatter.date(from: dateStr)!;
    }
    
    /// String -> Date(默认格式)
    public static func dateFromString(_ dateStr:String) -> Date {
        return DateFormatter.dateFromString(dateStr, fmt: kDateFormat);
    }
    
    /// 时间戳字符串 -> 日期字符串
    public static func stringFromInterval(_ interval:String, fmt:String) -> String {
        let date = Date(timeIntervalSince1970: interval.doubleValue())
        return DateFormatter.stringFromDate(date, fmt: fmt);
    }
    
    /// 时间戳字符串 -> 日期字符串(默认格式)
    public static func stringFromInterval(_ interval:String) -> String {
        return DateFormatter.stringFromInterval(interval, fmt: kDateFormat)
    }
    
    /// 日期字符串 -> 时间戳字符串
    public static func IntervalFromDateStr(_ dateStr:String, fmt:String) -> String {
        let date = DateFormatter.dateFromString(dateStr, fmt: fmt)
        return "\(date.timeIntervalSince1970)";
    }
    
    /// 日期字符串 -> 时间戳字符串(默认格式)
    public static func IntervalFromDateStr(_ dateStr:String) -> String {
        let date = DateFormatter.dateFromString(dateStr, fmt: kDateFormat)
        return "\(date.timeIntervalSince1970)";
    }
    
}


public extension Date{
    public static var calendar: Calendar = Calendar(identifier: .gregorian)

    public func string(formatStr:String) -> String{
        let formatter = DateFormatter.format(formatStr);
        let dateStr = formatter.string(from: self as Date);
        return dateStr;
    }
    
    public func dateBefore(_ interval: TimeInterval) -> Date{
        let aTimeInterval = self.timeIntervalSinceReferenceDate - interval;
        return Date(timeIntervalSinceReferenceDate: aTimeInterval);
    }
    
    public func dateBefore(_ interval: TimeInterval, fmt:String) -> String{
        let newDate = self.dateBefore(interval);
        return newDate.string(formatStr: fmt);
    }
    
    public func agoInfo() -> String {
        var interval = Date().timeIntervalSinceNow - self.timeIntervalSinceNow

        var info = "\(Int(interval/kDate_day))" + "天"
        interval = interval.truncatingRemainder(dividingBy: kDate_day);
        
        info += "\(Int(interval/kDate_hour))" + "小时"
        interval = interval.truncatingRemainder(dividingBy: kDate_hour);
        
        info += "\(Int(interval/kDate_minute))" + "分钟"
        interval = interval.truncatingRemainder(dividingBy: kDate_minute);
        
        info += "\(Int(interval))" + "秒之前"
        return info;
    }
    
    public func hourInfoBetween(_ date: Date,_ type: Int) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        switch type {
            case 1://分钟
                diff = fabs(diff/60)

            case 2://小时
                diff = fabs(diff/3600)

            case 3://天
                diff = fabs(diff/86400)

            default://秒
                diff = fabs(diff)
        }
        return diff;
    }
    
    public func daysInBetween(_ date: Date) -> Double {
        return hourInfoBetween(date, 3)
    }
    
    public func hoursInBetween(_ date: Date) -> Double {
        return hourInfoBetween(date, 2)
    }
    
    public func minutesInBetween(_ date: Date) -> Double {
        return hourInfoBetween(date, 1)
    }
    
    public func secondsInBetween(_ date: Date) -> Double {
        return hourInfoBetween(date, 0)
    }
    
    //MARK: - 获取日期各种值
    
    /// 获取默认DateComponents[年月日]
    static func dateComponents(_ aDate: Date) -> DateComponents {
        let com = Date.calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: aDate)
        return com
    }
    
    /// 两个时间差的NSDateComponents
    static func dateFrom(_ aDate: Date, anotherDate: Date) -> DateComponents {
        let com = Date.calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: aDate, to: anotherDate)
        return com
    }
    
    ///包含2个日期的年/月/日/时/分/秒数量
    static func numDateFrom(_ aDate: Date, anotherDate: Date, type: Int) -> Int {
        let comp = Date.dateComponents(aDate)
        let comp1 = Date.dateComponents(anotherDate)

        var number = comp1.year! - comp.year! + 1;
        switch type {
        case 1:
            number = comp1.month! - comp.month! + 1;
            
        case 2:
            number = comp1.day! - comp.day! + 1;

        case 3:
            number = comp1.hour! - comp.hour! + 1;

        case 4:
            number = comp1.minute! - comp.minute! + 1;

        case 5:
            number = comp1.second! - comp.second! + 1;

        default:
            break;
        }
        return number
    }
    
    //MARK: 年
    public func year() ->Int {
        return Date.dateComponents(self).year!
    }
    //MARK: 月
    public func month() ->Int {
        return Date.dateComponents(self).month!
    }
    //MARK: 日
    public func day() ->Int {
        return Date.dateComponents(self).day!;
    }
    
    //MARK: 一周的第几天
    public static func weekDay(_ comp: DateComponents) ->Int{
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let newDate = Date.calendar.date(from: comp)
        let weekDay = Date.calendar.component(.weekday, from: newDate!)
        return weekDay
    }
    
    //MARK: 当月天数
    public func countOfDaysInMonth() ->Int {
        let calendar = Date.calendar
        let range = (calendar as NSCalendar?)?.range(of: .day, in: .month, for: self)
        return range!.length
//        let range = Date.calendar.range(of: .day, in: .month, for: aDate);
//        return range!.upperBound - range!.lowerBound
    }
    //MARK: 当月第一天是星期几
    public func firstWeekDay() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        var comp: DateComponents = Date.dateComponents(self)
        comp.day = 1
        
        let firstWeekDay = Date.weekDay(comp)
        return firstWeekDay
//        let firstWeekDay = Date.calendar.ordinality(of: .weekday, in: .weekOfMonth, for: self)
//        return firstWeekDay! - 1
    }
    //MARK: - 日期的一些比较
    /// 两个时间同年0;同月1;同日2;同时3;同分4;同秒5
    public static func isSameFrom(_ aDate: Date, anotherDate: Date, type: Int) -> Bool {
        let comp = Date.dateComponents(aDate)
        let comp1 = Date.dateComponents(anotherDate)
        
        var isSame = (comp1.year == comp.year);
        switch type {
        case 1:
            isSame = (comp1.year == comp.year && comp1.month == comp.month);
            
        case 2:
            isSame = (comp1.year == comp.year && comp1.month == comp.month && comp1.day == comp.day);
            
        case 3:
            isSame = (comp1.year == comp.year && comp1.month == comp.month && comp1.day == comp.day && comp1.hour == comp.hour);
            
        case 4:
            isSame = (comp1.year == comp.year && comp1.month == comp.month && comp1.day == comp.day && comp1.hour == comp.hour && comp1.minute == comp.minute);
            
        case 5:
            isSame = (comp1.year == comp.year && comp1.month == comp.month && comp1.day == comp.day && comp1.hour == comp.hour && comp1.second == comp.second);
            
        default:
            break;
        }
        return isSame
    }
    //是否是今天
    public func isToday() ->Bool {
        return Date.isSameFrom(self, anotherDate: Date(), type: 2)
    }
    //是否是这个月
    public func isThisMonth() ->Bool {
        return Date.isSameFrom(self, anotherDate: Date(), type: 1)
    }
 
    public func isThisYear() ->Bool {
        return Date.isSameFrom(self, anotherDate: Date(), type: 0)
    }
    
    /// DateComponents(年月日时分秒)
    public static func components(_ year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) ->DateComponents{
        return DateComponents(calendar: Date.calendar, timeZone: nil, era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    }
    
    
}
