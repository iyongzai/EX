//
//  public extension-Number-2-String.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/16.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation

fileprivate let doubleToStringFM: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.usesSignificantDigits = true
    formatter.maximumSignificantDigits = 25
    formatter.groupingSeparator = ""
    formatter.numberStyle = .decimal
    formatter.decimalSeparator = "."
    
    return formatter
}()
// MARK: - Double
public extension Double {
    /// Double类型转String（可修正精度问题）
    ///
    /// - Returns: String
    func fixToString() -> String {
        let stringValue = doubleToStringFM.string(from: NSNumber(value: self))!
        return stringValue.trimDecimalTail0()
    }
    
    /// Double类型转String，保留指定小数位，多余的小数位会被舍弃（直接舍弃，非四舍五入）
    ///
    /// - Parameter maxLength: 最大小数位
    /// - Returns: String
    func toString(maxLength: Int16 = 8) -> String {
        var result = self.fixToString()
        guard result.contains(".") else {
            return result
        }
        let arr = result.components(separatedBy: ".")
        if arr.count == 2 {
            let lastStr = arr[1]
            if lastStr.length > maxLength {
                result = arr[0] + "." + lastStr.subString(start: 0, length: Int(maxLength))
            }
        }
        return result
    }
    /// Double类型转String，满1000折合k显示，折算后可指定小数位，默认保留2位小数
    ///
    /// - Parameters:
    ///   - kLength: 小数位
    ///   - forceDecimalDigits: 非k显示情况下强制性保留小数位
    /// - Returns: String
    func toKString(kLength: Int16 = 2, forceDecimalDigits: Int16? = nil) -> String {
        guard self > 1000 else {
            if forceDecimalDigits != nil {
                return self.fixToString().decimal(forceDigits: UInt(forceDecimalDigits!))
            }
            return self.fixToString()
        }
        return (self/1000).toString(maxLength:kLength) + "k"
    }
}

public extension Double {
    func toString() -> String { "\(self)" }
}
public extension CGFloat {
    func toString() -> String { "\(self)" }
}
public extension Float {
    func toString() -> String { "\(self)" }
}
public extension Int {
    func toString() -> String { "\(self)" }
}
public extension Int8 {
    func toString() -> String { "\(self)" }
}
public extension Int16 {
    func toString() -> String { "\(self)" }
}
public extension Int32 {
    func toString() -> String { "\(self)" }
}
public extension Int64 {
    func toString() -> String { "\(self)" }
}
public extension UInt {
    func toString() -> String { "\(self)" }
}
public extension UInt8 {
    func toString() -> String { "\(self)" }
}
public extension UInt16 {
    func toString() -> String { "\(self)" }
}
public extension UInt32 {
    func toString() -> String { "\(self)" }
}
public extension UInt64 {
    func toString() -> String { "\(self)" }
}
