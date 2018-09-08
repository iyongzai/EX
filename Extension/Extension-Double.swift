//
//  Extension-Double.swift
//  iVCoin
//
//  Created by ayong on 2018/6/8.
//  Copyright © 2018年 阿勇. All rights reserved.
//

import Foundation

extension Double {
    func toString() -> String
    {
        var stringValue : String = "0.00"
        
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 100
        formatter.groupingSeparator = ""
        formatter.numberStyle = .decimal
        stringValue = formatter.string(from: NSNumber(value: self))!
        
        return stringValue
    }
    func toString(maxLength: Int = 8) -> String {
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
    func toKString(kLength: Int = 2) -> String {
        guard self > 1000 else {
            return self.toString()
        }
        return (self/1000).toString(maxLength:kLength) + "k"
    }
}
