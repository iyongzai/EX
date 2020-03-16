//
//  Extension-String-2-Number.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/16.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation

// MARK: - To Double
public extension String {
    
    /// string -> Double
    func toDouble() -> Double? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }
        
        let num = NSDecimalNumber.init(string: self)
        return num.doubleValue
    }
    
    /// string -> Double
    func toDoubleValue() -> Double {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }
        
        let num = NSDecimalNumber.init(string: self)
        return num.doubleValue
    }
}



// MARK: - To Float
public extension String {
    
    /// string -> Double
    func toFloat() -> Float? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }
        
        let num = NSDecimalNumber.init(string: self)
        return num.floatValue
    }
    
    /// string -> Double
    func toFloatValue() -> Float {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }
        
        let num = NSDecimalNumber.init(string: self)
        return num.floatValue
    }
}


// MARK: - To Int
public extension String {

    /// string -> Double
    func toInt() -> Int? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.intValue
    }

    /// string -> Double
    func toIntValue() -> Int {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.intValue
    }
}

// MARK: - To Int8
public extension String {

    /// string -> Double
    func toInt8() -> Int8? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.int8Value
    }

    /// string -> Double
    func toInt8Value() -> Int8 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.int8Value
    }
}

// MARK: - To Int16
public extension String {

    /// string -> Double
    func toInt16() -> Int16? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.int16Value
    }

    /// string -> Double
    func toInt16Value() -> Int16 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.int16Value
    }
}

// MARK: - To Int32
public extension String {

    /// string -> Double
    func toInt32() -> Int32? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.int32Value
    }

    /// string -> Double
    func toInt32Value() -> Int32 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.int32Value
    }
}

// MARK: - To Int64
public extension String {

    /// string -> Double
    func toInt64() -> Int64? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.int64Value
    }

    /// string -> Double
    func toInt64Value() -> Int64 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.int64Value
    }
}

// MARK: - To UInt
public extension String {

    /// string -> Double
    func toUInt() -> UInt? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.uintValue
    }

    /// string -> Double
    func toUIntValue() -> UInt {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.uintValue
    }
}

// MARK: - To UInt8
public extension String {

    /// string -> Double
    func toUInt8() -> UInt8? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.uint8Value
    }

    /// string -> Double
    func toUInt8Value() -> UInt8 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.uint8Value
    }
}

// MARK: - To UInt16
public extension String {

    /// string -> Double
    func toUInt16() -> UInt16? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.uint16Value
    }

    /// string -> Double
    func toUInt16Value() -> UInt16 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.uint16Value
    }
}


// MARK: - To UInt32
public extension String {

    /// string -> Double
    func toUInt32() -> UInt32? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.uint32Value
    }

    /// string -> Double
    func toUInt32Value() -> UInt32 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.uint32Value
    }
}
// MARK: - To UInt64
public extension String {

    /// string -> Double
    func toUInt64() -> UInt64? {
        guard self.length > 0 else { return nil }
        guard canConvertToNumber else { return nil }

        let num = NSDecimalNumber.init(string: self)
        return num.uint64Value
    }

    /// string -> Double
    func toUInt64Value() -> UInt64 {
        guard self.length > 0 else {
            return 0
        }
        guard canConvertToNumber else { return 0 }

        let num = NSDecimalNumber.init(string: self)
        return num.uint64Value
    }
}


// MARK: - canConvertToNumber
fileprivate let numberFM: NumberFormatter = {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    
    return f
}()
public extension String {
    /// string -> number
    var canConvertToNumber: Bool {
        get { return numberFM.number(from: self) != nil }
    }
}
