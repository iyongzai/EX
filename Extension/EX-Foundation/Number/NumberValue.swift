//
//  NumberValue.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/16.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation
import CoreGraphics

// MARK: - NumberValue Declarations
public protocol NumberValue {
    func toNSDecimalNumber() -> NSDecimalNumber
}
// MARK: - 加减乘除
public extension NumberValue {
    
    /// 两数之和
    /// - Parameters:
    ///   - rhs: 加数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之和
    func adding<T: NumberValue>(_ rhs: T,
                                scale: Int16 = baseScale,
                                roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        return self.toNSDecimalNumber().adding(rhs.toNSDecimalNumber(), scale: scale, roundingMode: roundingMode)
    }
    
    /// 两数之差
    /// - Parameters:
    ///   - rhs: 减数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数之差
    func subtracting<T: NumberValue>(_ rhs: T,
                                     scale: Int16 = baseScale,
                                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        return self.toNSDecimalNumber().subtracting(rhs.toNSDecimalNumber(), scale: scale, roundingMode: roundingMode)
    }
    
    /// 两数乘积
    /// - Parameters:
    ///   - rhs: 乘数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数乘积
    func multiplying<T: NumberValue>(_ rhs: T,
                                     scale: Int16 = baseScale,
                                     roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        return self.toNSDecimalNumber().multiplying(rhs.toNSDecimalNumber(), scale: scale, roundingMode: roundingMode)
    }
    
    /// 两数相除
    /// - Parameters:
    ///   - rhs: 除数
    ///   - scale: 小数个数（小数点后的位数）
    ///   - roundingMode: 取舍规则
    /// - Returns: 两数相除
    func dividing<T: NumberValue>(_ rhs: T,
                                  scale: Int16 = baseScale,
                                  roundingMode: NSDecimalNumber.RoundingMode = .plain) -> NSDecimalNumber {
        return self.toNSDecimalNumber().dividing(rhs.toNSDecimalNumber(), scale: scale, roundingMode: roundingMode)
    }
}
public protocol FloatPointValue: NumberValue {}

extension Double: FloatPointValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension CGFloat: FloatPointValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: Double(self)) }
}
extension Float: FloatPointValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}

extension Int: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension Int8: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension Int16: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension Int32: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension Int64: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}

extension UInt: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension UInt8: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension UInt16: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension UInt32: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
extension UInt64: NumberValue {
    public func toNSDecimalNumber() -> NSDecimalNumber { NSDecimalNumber(value: self) }
}
