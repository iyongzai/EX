//
//  Extension-Date.swift
//  AYSeg
//
//  Created by zhiyong yin on 2019/4/26.
//

import Foundation

extension Date {
    
    //MARK: - 获取明天的日期
    /// 获取明天的日期
    ///
    /// - Returns: 当前日期时间往未来推移24小时Date
    public func tomorrow() -> Date {
        return Date.init(timeIntervalSince1970: self.timeIntervalSince1970+3600*24)
    }
    //MARK: - 获取昨天的日期
    /// 获取昨天的日期
    ///
    /// - Returns: 当前日期时间往历史推移24小时Date
    public func yesterday() -> Date {
        return Date.init(timeIntervalSince1970: self.timeIntervalSince1970-3600*24)
    }
}

public extension Date {
    
    
    /// 根据参数创建日期
    /// - Parameters:
    ///   - year: year
    ///   - month: month
    ///   - day: day
    ///   - hour: hour
    ///   - minute: minute
    ///   - second: second
    /// - Returns: Date
    static func date(year: Int,
                     month: Int,
                     day: Int,
                     hour: Int,
                     minute: Int,
                     second: Int) -> Date? {
        let gregorian = Calendar.init(identifier: .gregorian)
        let dateComps = DateComponents.init(calendar: gregorian,
                                            timeZone: TimeZone.current,
                                            year: year,
                                            month: month,
                                            day: day,
                                            hour: hour,
                                            minute: minute,
                                            second: second)
        return dateComps.date
    }
    
    /// 当天指定时分后生成时间
    /// - Parameters:
    ///   - hour: 时
    ///   - minute: 分
    /// - Returns: Date
    static func date(hour: Int, minute: Int) -> Date? {
        let now = Date()
        let calendar = Calendar.init(identifier: .gregorian)
        var components = calendar.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day],
                                            from: now)
        components.hour = hour
        components.minute = minute
        return calendar.date(from: components)
    }
    
    /// 时间差（单位为天）
    /// - Parameter endDate: Date
    /// - Returns: 返回时间差（单位为天）
    func daysOffset(endDate: Date) -> Int? {
        let gregorian = Calendar.init(identifier: .gregorian)
        let comps = gregorian.dateComponents([Calendar.Component.day], from: self, to: endDate)
        let day = comps.day
        return day
    }
    
    /// 时间差（单位为秒）
    /// - Parameter endDate: Date
    /// - Returns: 返回时间差（单位为秒）
    func secondsOffset(endDate: Date) -> Int? {
        let gregorian = Calendar.init(identifier: .gregorian)
        let comps = gregorian.dateComponents([Calendar.Component.second], from: self, to: endDate)
        let second = comps.second
        return second
    }
    
    // MARK: - Data component
    
    func year() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: self)
        return components.year
    }
    func month() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: self)
        return components.month
    }
    func day() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: self)
        return components.day
    }
    func hour() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute], from: self)
        return components.hour
    }
    func minute() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute], from: self)
        return components.minute
    }
    func second() -> Int? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second], from: self)
        return components.second
    }
    func weekday() -> String? {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.weekday, Calendar.Component.weekdayOrdinal], from: self)
        guard let weekday = components.weekday else { return nil }
        var week: String?
        switch weekday {
        case 1:
            week = "周日"
        case 2:
            week = "周一"
        case 3:
            week = "周二"
        case 4:
            week = "周三"
        case 5:
            week = "周四"
        case 6:
            week = "周五"
        case 7:
            week = "周六"
        default:
            break;
        }
        return week
    }
}
