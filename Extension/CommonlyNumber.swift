//
//  CommonlyNumber.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/16.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation
//import CoreGraphics


public protocol CommonlyNumber {
    
}
extension Double: CommonlyNumber {}
//extension CGFloat: CommonlyNumber {}
extension Float: CommonlyNumber {}

extension Int: CommonlyNumber {}
extension Int8: CommonlyNumber {}
extension Int16: CommonlyNumber {}
extension Int32: CommonlyNumber {}
extension Int64: CommonlyNumber {}

extension UInt: CommonlyNumber {}
extension UInt8: CommonlyNumber {}
extension UInt16: CommonlyNumber {}
extension UInt32: CommonlyNumber {}
extension UInt64: CommonlyNumber {}

