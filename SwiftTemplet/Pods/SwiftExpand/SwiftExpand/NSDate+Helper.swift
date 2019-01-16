//
//  Date+Helper.swift
//  SwiftTemplet
//
//  Created by dev on 2018/12/11.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public let kDate_minute : Double = 60 ;
public let kDate_hour : Double  = 3600 ;
public let kDate_day : Double   = 86400 ;
public let kDate_week : Double   = 604800 ;
public let kDate_year : Double   = 31556926 ;

public let kDateFormat = "yyyy-MM-dd HH:mm:ss";
public let kDateFormat_one = "yyyy-MM-dd";
public let kDateFormat_two = "yyyyMMdd";
public let kDateFormat_three = "yyyy-MM-dd HH:mm";

public extension DateFormatter{
    
    public static func format(_ formatStr:String) -> DateFormatter {
        
        let dic = Thread.current.threadDictionary;
        if dic.object(forKey: formatStr) != nil {
            return dic.object(forKey: formatStr) as! DateFormatter;
        }
        
        let fmt = DateFormatter();
        fmt.dateFormat = formatStr;
        fmt.locale = .current;
        fmt.timeZone = NSTimeZone.local;
        dic.setObject(fmt, forKey: formatStr as NSCopying)
        return fmt;
    }
    
    public static func format(_ date:Date, fmt:String) -> String {
        let formatter = DateFormatter.format(fmt);
        return formatter.string(from: date);
    }
    
    public static func format(dateStr:String, fmt:String) -> Date? {
        let fmt = DateFormatter.format(fmt);
        return fmt.date(from: dateStr);
    }
    
    public static func format(_ interval:TimeInterval, fmt:String) -> String? {
        let timeInterval: TimeInterval = TimeInterval(interval)
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateFormatter.format(date, fmt: fmt);
    }
    
    public static func format(_ interval:String, fmt:String) -> String? {
        return DateFormatter.format(interval.doubleValue(), fmt: fmt);
    }
}


public extension Date{
    
//    public func string(formatStr:String, date:Date) -> String{
//        let formatter = DateFormatter.format(formatStr);
//        let dateStr = formatter.string(from: date);
//        return dateStr;
//    }
    
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
    //MARK: 年
    func year() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.year!
    }
    //MARK: 月
    func month() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.month!
        
    }
    //MARK: 日
    func day() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.day!
        
    }
    //MARK: 星期几
    func weekDay()->Int{
        let interval = Int(self.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    //MARK: 当月天数
    func countOfDaysInMonth() ->Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return (range?.length)!
        
    }
    //MARK: 当月第一天是星期几
    func firstWeekDay() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: self)
        return firstWeekDay! - 1
        
    }
    //MARK: - 日期的一些比较
    //是否是今天
    func isToday()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }
    //是否是这个月
    func isThisMonth()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }
 
    
}
