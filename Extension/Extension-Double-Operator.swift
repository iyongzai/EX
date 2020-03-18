//
//  Extension-Double.swift
//  iVCoin
//
//  Created by ayong on 2018/6/8.
//  Copyright © 2018年 阿勇. All rights reserved.
//

import Foundation


/// 优先级组官方文档 https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
/// 自定义运算符 prefix infix postfix


/// 加减法优先级组
precedencegroup AYAdditionPrecedence {
    associativity: left//左结合
    higherThan: AdditionPrecedence//优先级：比加法高
    lowerThan: MultiplicationPrecedence//优先级：比乘法低
}
/// 乘除法优先级组
precedencegroup AYMultiplicationPrecedence {
    associativity: left//左结合
    higherThan: MultiplicationPrecedence//优先级：比乘法高
    lowerThan: BitwiseShiftPrecedence//优先级：比>>低
}

infix operator .-: AYAdditionPrecedence
infix operator .+: AYAdditionPrecedence
infix operator .*: AYMultiplicationPrecedence
infix operator ./: AYMultiplicationPrecedence


public func .+ (lhs: Double, rhs: Double) -> Double {
    debugPrint(#file+#function)
    return lhs.adding(rhs).doubleValue
}
public func .- (lhs: Double, rhs: Double) -> Double {
    debugPrint(#file+#function)
    return lhs.subtracting(rhs).doubleValue
}
public func .* (lhs: Double, rhs: Double) -> Double {
    debugPrint(#file+#function)
    return lhs.multiplying(rhs).doubleValue
}
public func ./ (lhs: Double, rhs: Double) -> Double {
    debugPrint(#file+#function)
    return lhs.dividing(rhs).doubleValue
}


public var baseScale: Int16 = 9

public extension Double {
    static func + (lhs: Double, rhs: Double) -> Double {
        debugPrint(#file+#function)
        return lhs.adding(rhs).doubleValue
    }
    
    static func - (lhs: Double, rhs: Double) -> Double {
        debugPrint(#file+#function)
        return lhs.subtracting(rhs).doubleValue
    }
    
    static func * (lhs: Double, rhs: Double) -> Double {
        debugPrint(#file+#function)
        return lhs.multiplying(rhs).doubleValue
    }
    
    static func / (lhs: Double, rhs: Double) -> Double {
        debugPrint(#file+#function)
        return lhs.dividing(rhs).doubleValue
    }
}




public extension Double {
    func adding(_ rhs: Double) -> NSDecimalNumber {
        debugPrint(#file+#function)
        
        let lValue = NSDecimalNumber(value: self)
        let rValue = NSDecimalNumber(value: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: baseScale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let resultValue = lValue.adding(rValue, withBehavior: handle)
        
        return resultValue
    }
    
    func subtracting(_ rhs: Double) -> NSDecimalNumber {
        debugPrint(#file+#function)
        
        let lValue = NSDecimalNumber(value: self)
        let rValue = NSDecimalNumber(value: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: baseScale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let resultValue = lValue.subtracting(rValue, withBehavior: handle)
        
        return resultValue
    }
    
    func multiplying(_ rhs: Double) -> NSDecimalNumber {
        debugPrint(#file+#function)
        
        let lValue = NSDecimalNumber(value: self)
        let rValue = NSDecimalNumber(value: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: baseScale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let resultValue = lValue.multiplying(by: rValue, withBehavior: handle)
        
        return resultValue
    }
    
    func dividing(_ rhs: Double) -> NSDecimalNumber {
        debugPrint(#file+#function)
        
        let lValue = NSDecimalNumber(value: self)
        let rValue = NSDecimalNumber(value: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: baseScale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let resultValue = lValue.dividing(by: rValue, withBehavior: handle)
        
        return resultValue
    }
}
