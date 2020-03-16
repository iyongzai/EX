//
//  Extension-Double.swift
//  iVCoin
//
//  Created by ayong on 2018/6/8.
//  Copyright © 2018年 阿勇. All rights reserved.
//

import Foundation

extension Double {
    /// Double类型转String，保留指定小数位，多余的小数位会被舍弃（直接舍弃，非四舍五入）
    ///
    /// - Parameter maxLength: 最大小数位
    /// - Returns: String
    public func toString(maxLength: Int = 8) -> String {
        var result = self.toString()
        guard result.contains(".") else {
            return result
        }
        let arr = result.components(separatedBy: ".")
        if arr.count == 2 {
            let lastStr = arr[1]
            if lastStr.length > maxLength {
                result = arr[0] + "." + lastStr.subString(start: 0, length: maxLength)
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
    public func toKString(kLength: Int = 2, forceDecimalDigits: Int? = nil) -> String {
        guard self > 1000 else {
            if forceDecimalDigits != nil {
                return self.toString().decimal(forceDigits: UInt(forceDecimalDigits!))
            }
            return self.toString()
        }
        return (self/1000).toString(maxLength:kLength) + "k"
    }
}




