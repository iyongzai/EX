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
    
    func toDouble() -> Double? {
        return stringToDoubleFM.number(from: self)?.doubleValue
    }
    
    func toDoubleValue() -> Double {
        return toDouble() ?? 0
    }
}



// MARK: - To Float
public extension String {
    
    func toFloat() -> Float? {
        return stringToDoubleFM.number(from: self)?.floatValue
    }
    
    func toFloatValue() -> Float {
        return stringToDoubleFM.number(from: self)?.floatValue ?? 0
    }
}


// MARK: - To Int
public extension String {

    func toInt() -> Int? {
        return stringToDoubleFM.number(from: self)?.intValue
    }

    func toIntValue() -> Int {
        return stringToDoubleFM.number(from: self)?.intValue ?? 0
    }
}

// MARK: - To Int8
public extension String {

    func toInt8() -> Int8? {
        return stringToDoubleFM.number(from: self)?.int8Value
    }

    func toInt8Value() -> Int8 {
        return stringToDoubleFM.number(from: self)?.int8Value ?? 0
    }
}

// MARK: - To Int16
public extension String {

    func toInt16() -> Int16? {
        return stringToDoubleFM.number(from: self)?.int16Value
    }

    func toInt16Value() -> Int16 {
        return stringToDoubleFM.number(from: self)?.int16Value ?? 0
    }
}

// MARK: - To Int32
public extension String {

    func toInt32() -> Int32? {
        return stringToDoubleFM.number(from: self)?.int32Value
    }

    func toInt32Value() -> Int32 {
        return stringToDoubleFM.number(from: self)?.int32Value ?? 0
    }
}

// MARK: - To Int64
public extension String {

    func toInt64() -> Int64? {
        return stringToDoubleFM.number(from: self)?.int64Value
    }

    func toInt64Value() -> Int64 {
        return stringToDoubleFM.number(from: self)?.int64Value ?? 0
    }
}

// MARK: - To UInt
public extension String {

    func toUInt() -> UInt? {
        return stringToDoubleFM.number(from: self)?.uintValue
    }

    func toUIntValue() -> UInt {
        return stringToDoubleFM.number(from: self)?.uintValue ?? 0
    }
}

// MARK: - To UInt8
public extension String {

    func toUInt8() -> UInt8? {
        return stringToDoubleFM.number(from: self)?.uint8Value
    }

    func toUInt8Value() -> UInt8 {
        return stringToDoubleFM.number(from: self)?.uint8Value ?? 0
    }
}

// MARK: - To UInt16
public extension String {

    func toUInt16() -> UInt16? {
        return stringToDoubleFM.number(from: self)?.uint16Value
    }

    func toUInt16Value() -> UInt16 {
        return stringToDoubleFM.number(from: self)?.uint16Value ?? 0
    }
}


// MARK: - To UInt32
public extension String {

    func toUInt32() -> UInt32? {
        return stringToDoubleFM.number(from: self)?.uint32Value
    }

    func toUInt32Value() -> UInt32 {
        return stringToDoubleFM.number(from: self)?.uint32Value ?? 0
    }
}
// MARK: - To UInt64
public extension String {

    func toUInt64() -> UInt64? {
        return stringToDoubleFM.number(from: self)?.uint64Value
    }

    func toUInt64Value() -> UInt64 {
        return stringToDoubleFM.number(from: self)?.uint64Value ?? 0
    }
}


fileprivate let stringToDoubleFM = NumberFormatter()

// MARK: - canConvertToNumber
fileprivate let numberFM: NumberFormatter = {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    
    return f
}()
public extension String {
    var canConvertToNumber: Bool {
        get { return numberFM.number(from: self) != nil }
    }
}
