//
//  Extension-String-O.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/18.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation

//MARK: - To NSDecimalNumber(创建NSDecimalNumber)
public extension String {
    var toNSDecimalNumber: NSDecimalNumber { toNSDecimalNumber(locale: nil) }
    
    /// 创建一个NSDecimalNumber对象
    /// - Parameter locale: locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    /// - Returns: 返回创建的NSDecimalNumber对象
    func toNSDecimalNumber(locale: Any? = nil) -> NSDecimalNumber {
        let result = NSDecimalNumber(string: self, locale: locale)
        if result == NSDecimalNumber.notANumber { print("格式异常，\(self)不是一个数字") }
        return result
    }
}

//MARK: - Decimal Separator(精度)
public extension String {
    static var defaultDecimalSeparator = DecimalSeparator.default {
        didSet { defaultLocaleForDecimalSeparator = [NSLocale.Key.decimalSeparator : defaultDecimalSeparator] }
    }
    fileprivate(set) static var defaultLocaleForDecimalSeparator = [NSLocale.Key.decimalSeparator : defaultDecimalSeparator]
    static func locale(decimalSeparator: String = defaultDecimalSeparator) -> [NSLocale.Key : String] {
        guard decimalSeparator != defaultDecimalSeparator else {
            return defaultLocaleForDecimalSeparator
        }
        return [NSLocale.Key.decimalSeparator : decimalSeparator]
    }
    /// 获取小数点分隔符
    /// - 以下国家或地区以句点<.>来表示基点：
    ///
    ///澳洲、汶莱、博茨瓦纳、加拿大英语地区、香港、澳门（民间及中文的官方文件使用）、中国、印度、爱尔兰、以色列、日本、韩国、朝鲜、马来西亚、墨西哥、新西兰、尼日利亚、巴基斯坦、菲律宾、新加坡、斯里兰卡、泰国、英国、美国
    /// - 以下国家或地区以逗号<,>来表示基点：
    ///
    ///阿尔巴尼亚、安道尔、阿根廷、奥地利、阿塞拜疆、白俄罗斯、比利时、玻利维亚、波斯尼亚和黑塞哥维那、巴西、保加利亚、喀麦隆、加拿大法语地区、哥斯达黎加、克罗地亚、古马、智利、哥伦比亚、塞浦路斯、捷克、丹麦、多米尼加共和国、厄瓜多尔、萨尔瓦多、爱沙尼亚、法罗、芬兰、法国、德国、希腊、格陵兰、危地马拉、洪都拉斯、匈牙利、印度尼西亚、冰岛、意大利、拉脱维亚、立陶宛、马其顿共和国、摩尔多瓦、荷兰、澳门（葡语官方文件及土生葡人使用）挪威、尼加拉瓜、巴拿马、巴拉圭、秘鲁、波兰、葡萄牙、罗马尼亚、俄国、塞尔维亚、斯洛伐克、南非、斯洛文尼亚、西班牙、瑞典、瑞士、土耳其、乌克兰、乌拉圭、委内瑞拉、越南、津巴布韦
    /// - Parameter locale: locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    /// - Returns: 小数点分隔符
    func decimalSeparator(locale: Any?) -> String? {
        //guard toNSDecimalNumber(locale: locale) != .notANumber else { return nil }//为减少内存开销和CPU开销而注释
        guard locale != nil else { return nil }
                
        var decimalSeparator: String?
        
        if let dic = locale as? Dictionary<NSLocale.Key, Any>,
           let separator1 = dic[NSLocale.Key.decimalSeparator] as? String,
           !separator1.isEmpty {
            decimalSeparator = separator1
        }else{
            guard let locale = locale as? Locale else { return nil }
            decimalSeparator = locale.decimalSeparator
        }
        return decimalSeparator
    }
    /// 获取精度（小数点位数）
    func decimalScale(locale: Any?) -> Int16 {
        guard let decimalSeparator = decimalSeparator(locale: locale), !decimalSeparator.isEmpty else {
            return 0
        }
        guard contains(decimalSeparator) else { return 0 }
        
        return decimalScale(decimalSeparator: decimalSeparator)
    }
    /// 获取精度（小数点位数）
    func decimalScale(decimalSeparator: String) -> Int16 {
        let components = self.components(separatedBy: decimalSeparator)
        guard components.count == 2 else {
            print("精度异常，小数点个数不止一个")
            return 0
        }
        
        return Int16(components[1].count)
    }
}

//MARK: - caculator and return NSDecimalNumber type result(计算并返回NSDecimalNumber对象)
public extension String {
    
    /// The sum of a+b(两数之和)
    /// - Parameters:
    ///   - stringNumber: 加数
    ///   - selfLocale: self使用locale来创建一个NSDecimalNumber。备注：locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    ///   - rhsLocale: numberString使用locale来创建一个NSDecimalNumber。
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之和
    func adding(numberString rhs: String,
                selfLocale: Any? = nil,
                rhsLocale: Any? = nil,
                scale: Int16 = baseScale,
                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        let lValue = toNSDecimalNumber(locale: selfLocale)
        let rValue = rhs.toNSDecimalNumber(locale: rhsLocale)
        return lValue.adding(rValue, scale: scale, roundingMode: roundingMode)
    }
    /// a-b(两数之差)
    /// - Parameters:
    ///   - stringNumber: 减数
    ///   - selfLocale: self使用locale来创建一个NSDecimalNumber。备注：locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    ///   - rhsLocale: numberString使用locale来创建一个NSDecimalNumber。
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之差
    func subtracting(numberString rhs: String,
                     selfLocale: Any? = nil,
                     rhsLocale: Any? = nil,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        let lValue = toNSDecimalNumber(locale: selfLocale)
        let rValue = rhs.toNSDecimalNumber(locale: rhsLocale)
        return lValue.subtracting(rValue, scale: scale, roundingMode: roundingMode)
    }
    /// a*b(两数乘积)
    /// - Parameters:
    ///   - stringNumber: 乘数
    ///   - selfLocale: self使用locale来创建一个NSDecimalNumber。备注：locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    ///   - rhsLocale: numberString使用locale来创建一个NSDecimalNumber。
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数乘积
    func multiplying(numberString rhs: String,
                     selfLocale: Any? = nil,
                     rhsLocale: Any? = nil,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        let lValue = toNSDecimalNumber(locale: selfLocale)
        let rValue = rhs.toNSDecimalNumber(locale: rhsLocale)
        return lValue.multiplying(rValue, scale: scale, roundingMode: roundingMode)
    }
    /// a/b(两数相除)
    /// - Parameters:
    ///   - stringNumber: 除数
    ///   - selfLocale: self使用locale来创建一个NSDecimalNumber。备注：locale代表一种格式，就像date的格式化一样（可以参考： https://blog.csdn.net/u014773226/article/details/54290000）
    ///   - rhsLocale: numberString使用locale来创建一个NSDecimalNumber。
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数相除
    func dividing(numberString rhs: String,
                  selfLocale: Any? = nil,
                  rhsLocale: Any? = nil,
                  scale: Int16 = baseScale,
                  roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        let lValue = toNSDecimalNumber(locale: selfLocale)
        let rValue = rhs.toNSDecimalNumber(locale: rhsLocale)
        return lValue.dividing(rValue, scale: scale, roundingMode: roundingMode)
    }
}

//MARK: - caculator and return String type result(计算并返回String)
public extension String {
    /// The sum of a+b(两数之和)
    /// - Parameters:
    ///   - stringNumber: 加数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之和
    func adding(numberString rhs: String,
                selfDecimalSeparator: String = defaultDecimalSeparator,
                rhsDecimalSeparator: String = defaultDecimalSeparator,
                scale: Int16 = baseScale,
                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        return adding(numberString: rhs,
                      selfLocale: String.locale(decimalSeparator: selfDecimalSeparator),
                      rhsLocale: String.locale(decimalSeparator: rhsDecimalSeparator),
                      scale: scale,
                      roundingMode: roundingMode).stringValue
    }
    /// a-b(两数之差)
    /// - Parameters:
    ///   - stringNumber: 减数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之差
    func subtracting(numberString rhs: String,
                     selfDecimalSeparator: String = defaultDecimalSeparator,
                     rhsDecimalSeparator: String = defaultDecimalSeparator,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        return subtracting(numberString: rhs,
                           selfLocale: String.locale(decimalSeparator: selfDecimalSeparator),
                           rhsLocale: String.locale(decimalSeparator: rhsDecimalSeparator),
                           scale: scale,
                           roundingMode: roundingMode).stringValue
    }
    /// a*b(两数乘积)
    /// - Parameters:
    ///   - stringNumber: 乘数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数乘积
    func multiplying(numberString rhs: String,
                     selfDecimalSeparator: String = defaultDecimalSeparator,
                     rhsDecimalSeparator: String = defaultDecimalSeparator,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        return multiplying(numberString: rhs,
                           selfLocale: String.locale(decimalSeparator: selfDecimalSeparator),
                           rhsLocale: String.locale(decimalSeparator: rhsDecimalSeparator),
                           scale: scale,
                           roundingMode: roundingMode).stringValue
    }
    /// a/b(两数相除)
    /// - Parameters:
    ///   - stringNumber: 除数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数相除
    func dividing(numberString rhs: String,
                  selfDecimalSeparator: String = defaultDecimalSeparator,
                  rhsDecimalSeparator: String = defaultDecimalSeparator,
                  scale: Int16 = baseScale,
                  roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        return dividing(numberString: rhs,
                        selfLocale: String.locale(decimalSeparator: selfDecimalSeparator),
                        rhsLocale: String.locale(decimalSeparator: rhsDecimalSeparator),
                        scale: scale,
                        roundingMode: roundingMode).stringValue
    }
}

//MARK: - caculator and return String type result(计算并返回String) -- auto scale(精度自适应，小数点位数根据string自带小数位然后按autoScaleMode来决定)
public extension String {
    /// The sum of a+b(两数之和)
    /// - Parameters:
    ///   - stringNumber: 加数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - autoScaleMode: 小数个数（小数点后的位数，默认）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之和
    func addingByAutoScale(numberString rhs: String,
                           selfDecimalSeparator: String = defaultDecimalSeparator,
                           rhsDecimalSeparator: String = defaultDecimalSeparator,
                           autoScaleMode: AutoScaleForString = .max,
                           roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        let scale1 = decimalScale(decimalSeparator: selfDecimalSeparator)
        let scale2 = rhs.decimalScale(decimalSeparator: rhsDecimalSeparator)
        let scale = autoScaleMode == .max ? max(scale1, scale2) : min(scale1, scale2)
        return adding(numberString: rhs,
                      selfDecimalSeparator: selfDecimalSeparator,
                      rhsDecimalSeparator: rhsDecimalSeparator,
                      scale: scale,
                      roundingMode: roundingMode)
    }
    /// a-b(两数之差)
    /// - Parameters:
    ///   - stringNumber: 减数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - autoScaleMode: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之差
    func subtractingByAutoScale(numberString rhs: String,
                                selfDecimalSeparator: String = defaultDecimalSeparator,
                                rhsDecimalSeparator: String = defaultDecimalSeparator,
                                autoScaleMode: AutoScaleForString = .max,
                                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        let scale1 = decimalScale(decimalSeparator: selfDecimalSeparator)
        let scale2 = rhs.decimalScale(decimalSeparator: rhsDecimalSeparator)
        let scale = autoScaleMode == .max ? max(scale1, scale2) : min(scale1, scale2)
        return subtracting(numberString: rhs,
                           selfDecimalSeparator: selfDecimalSeparator,
                           rhsDecimalSeparator: rhsDecimalSeparator,
                           scale: scale,
                           roundingMode: roundingMode)
    }
    /// a*b(两数乘积)
    /// - Parameters:
    ///   - stringNumber: 乘数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - autoScaleMode: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数乘积
    func multiplyingByAutoScale(numberString rhs: String,
                                selfDecimalSeparator: String = defaultDecimalSeparator,
                                rhsDecimalSeparator: String = defaultDecimalSeparator,
                                autoScaleMode: AutoScaleForString = .max,
                                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        let scale1 = decimalScale(decimalSeparator: selfDecimalSeparator)
        let scale2 = rhs.decimalScale(decimalSeparator: rhsDecimalSeparator)
        let scale = autoScaleMode == .max ? max(scale1, scale2) : min(scale1, scale2)
        return multiplying(numberString: rhs,
                           selfDecimalSeparator: selfDecimalSeparator,
                           rhsDecimalSeparator: rhsDecimalSeparator,
                           scale: scale,
                           roundingMode: roundingMode)
    }
    /// a/b(两数相除)
    /// - Parameters:
    ///   - stringNumber: 除数
    ///   - selfDecimalSeparator: 小数分隔符，默认"."
    ///   - rhsDecimalSeparator: 小数分隔符，默认"."
    ///   - autoScaleMode: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数相除
    func dividingByAutoScale(numberString rhs: String,
                             selfDecimalSeparator: String = defaultDecimalSeparator,
                             rhsDecimalSeparator: String = defaultDecimalSeparator,
                             autoScaleMode: AutoScaleForString = .max,
                             roundingMode: NSDecimalNumber.RoundingMode = .plain) -> String {
        let scale1 = decimalScale(decimalSeparator: selfDecimalSeparator)
        let scale2 = rhs.decimalScale(decimalSeparator: rhsDecimalSeparator)
        let scale = autoScaleMode == .max ? max(scale1, scale2) : min(scale1, scale2)
        return dividing(numberString: rhs,
                        selfDecimalSeparator: selfDecimalSeparator,
                        rhsDecimalSeparator: rhsDecimalSeparator,
                        scale: scale,
                        roundingMode: roundingMode)
    }
}
