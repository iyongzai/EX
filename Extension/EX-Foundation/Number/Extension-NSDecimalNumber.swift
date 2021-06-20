//
//  Extension-NSDecimalNumber.swift
//  EX
//
//  Created by zhiyong yin on 2021/6/12.
//

import Foundation

/*
 NSDecimalNumberHandler
 let handle = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
 第一个参数roundingMode：
 public enum RoundingMode : UInt {
    /// 四舍五入
    case plain = 0
    /// 只舍不入
    case down = 1
    /// 只入不舍
    case up = 2
    /// 这个是特殊的四舍五入。保留位数的后一位为5时，根据保留位数的奇偶性来确定舍入规则。
    ///  例如：0.235保留两位小数，5前面为3，奇数要进1，结果为0.24。
    ///  如果是0.245，5前面为4，偶数要舍，结果为0.24。
    case bankers = 3
 }
 第二个参数scale： 保留小数个数(位数)
 其他参数：溢出等是否报错
 raiseOnExactness    发生精确错误时是否抛出异常，一般为NO
 raiseOnOverflow    发生溢出错误时是否抛出异常，一般为NO
 raiseOnUnderflow    发生不足错误时是否抛出异常，一般为NO
 raiseOnDivideByZero    被0除时是否抛出异常，一般为YES
 */

/// default value: 9
public var baseScale: Int16 = 9
public enum DecimalSeparator {
    public static let `default` = period
    public static let period = "."
    public static let comma = ","
}
public enum AutoScaleForString {
    case max
    case min
}

let baseNSDecimalNumberHandler: NSDecimalNumberHandler = {
    guard baseScale != 38 else { return NSDecimalNumberHandler.default }
    return NSDecimalNumberHandler(roundingMode: .plain,
                                  scale: baseScale,
                                  raiseOnExactness: false,
                                  raiseOnOverflow: false,
                                  raiseOnUnderflow: false,
                                  raiseOnDivideByZero: true)
}()
func getOrCreateNSDecimalNumberHandler(scale: Int16 = baseScale,
                                       roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumberHandler {
    guard roundingMode == baseNSDecimalNumberHandler.roundingMode(),
          scale == baseNSDecimalNumberHandler.scale() else {
        return NSDecimalNumberHandler(roundingMode: roundingMode,
                                      scale: scale,
                                      raiseOnExactness: false,
                                      raiseOnOverflow: false,
                                      raiseOnUnderflow: false,
                                      raiseOnDivideByZero: true)
    }
    return baseNSDecimalNumberHandler
}
public extension NSDecimalNumber {
    /// 两数之和
    /// - Parameters:
    ///   - rhs: 加数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之和
    func adding(_ rhs: NSDecimalNumber,
                scale: Int16 = baseScale,
                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        guard self != .notANumber, rhs != .notANumber else {
            print("格式异常，至少有一个不是一个数字")
            return .notANumber
        }
        return self.adding(rhs, withBehavior: getOrCreateNSDecimalNumberHandler(scale: scale, roundingMode: roundingMode))
    }
    
    /// 两数之差
    /// - Parameters:
    ///   - rhs: 减数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之差
    func subtracting(_ rhs: NSDecimalNumber,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        guard self != .notANumber, rhs != .notANumber else {
            print("格式异常，至少有一个不是一个数字")
            return .notANumber
        }
        return self.subtracting(rhs, withBehavior: getOrCreateNSDecimalNumberHandler(scale: scale, roundingMode: roundingMode))
    }
    
    /// 两数乘积
    /// - Parameters:
    ///   - rhs: 乘数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数乘积
    func multiplying(_ rhs: NSDecimalNumber,
                     scale: Int16 = baseScale,
                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        guard self != .notANumber, rhs != .notANumber else {
            print("格式异常，至少有一个不是一个数字")
            return .notANumber
        }
        return self.multiplying(by: rhs, withBehavior: getOrCreateNSDecimalNumberHandler(scale: scale, roundingMode: roundingMode))
    }
    
    /// 两数相除
    /// - Parameters:
    ///   - rhs: 除数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数相除
    func dividing(_ rhs: NSDecimalNumber,
                  scale: Int16 = baseScale,
                  roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        guard self != .notANumber, rhs != .notANumber else {
            print("格式异常，至少有一个不是一个数字")
            return .notANumber
        }
        guard rhs != .zero else {
            print("警告：除数不能为0(Warning: Divisor cannot be 0)")
            return .zero
        }
        return self.dividing(by: rhs, withBehavior: getOrCreateNSDecimalNumberHandler(scale: scale, roundingMode: roundingMode))
    }
}
