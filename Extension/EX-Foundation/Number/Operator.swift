//
//  Operator.swift
//  EX
//
//  Created by zhiyong yin on 2021/6/12.
//

import Foundation

/// 优先级组官方文档 https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
/// 自定义运算符 prefix infix postfix


/// 加减法优先级组
precedencegroup EXAdditionPrecedence {
    associativity: left//左结合
    higherThan: AdditionPrecedence//优先级：比加法高
    lowerThan: MultiplicationPrecedence//优先级：比乘法低
}
/// 乘除法优先级组
precedencegroup EXMultiplicationPrecedence {
    associativity: left//左结合
    higherThan: MultiplicationPrecedence//优先级：比乘法高
    lowerThan: BitwiseShiftPrecedence//优先级：比>>低
}

infix operator .-: EXAdditionPrecedence
infix operator .+: EXAdditionPrecedence
infix operator .*: EXMultiplicationPrecedence
infix operator ./: EXMultiplicationPrecedence


/// 两数之和，精度为baseScale（默认精度为9位小数， 四舍五入）
public func .+ <T: NumberValue> (lhs: T, rhs: T) -> NSDecimalNumber {
    return lhs.adding(rhs)
}
/// 两数之差，精度为baseScale（默认精度为9位小数， 四舍五入）
public func .- <T: NumberValue> (lhs: T, rhs: T) -> NSDecimalNumber {
    return lhs.subtracting(rhs)
}
/// 两数乘积，精度为baseScale（默认精度为9位小数， 四舍五入）
public func .* <T: NumberValue> (lhs: T, rhs: T) -> NSDecimalNumber {
    return lhs.multiplying(rhs)
}
/// 两数相除，精度为baseScale（默认精度为9位小数， 四舍五入）
public func ./ <T: NumberValue> (lhs: T, rhs: T) -> NSDecimalNumber {
    return lhs.dividing(rhs)
}
