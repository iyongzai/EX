//
//  public extension-Number-2-String.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/16.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation

// MARK: - Double
public extension Double {
    /// Double类型转String（可修正精度问题）
    ///
    /// - Returns: String
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
}

// MARK: - Float
public extension Float {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Int
public extension Int {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Int8
public extension Int8 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Int16
public extension Int16 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Int32
public extension Int32 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Int64
public extension Int64 {
    func toString() -> String {
        return "\(self)"
    }
}


// MARK: - UInt
public extension UInt {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - UInt8
public extension UInt8 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - UInt16
public extension UInt16 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - UInt32
public extension UInt32 {
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - UInt64
public extension UInt64 {
    func toString() -> String {
        return "\(self)"
    }
}
