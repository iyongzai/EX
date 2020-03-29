//
//  Extension-String-O.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/18.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation


public extension String {
    func addingWhenDouble(_ rhs: String, scale: Int16 = baseScale) -> String {
        EXPrint(#file+#function)
        
        guard Double(self) != nil else {
            EXPrint("\(self) is not number type")
            return "NaN"
        }
        guard Double(rhs) != nil else {
            EXPrint("\(rhs) is not number type")
            return "NaN"
        }
        
        let lValue = NSDecimalNumber(string: self)
        let rValue = NSDecimalNumber(string: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        return lValue.adding(rValue, withBehavior: handle).stringValue
    }
    
    func subtractingWhenDouble(_ rhs: String, scale: Int16 = baseScale) -> String {
        EXPrint(#file+#function)
        
        guard Double(self) != nil else {
            EXPrint("\(self) is not number type")
            return "NaN"
        }
        guard Double(rhs) != nil else {
            EXPrint("\(rhs) is not number type")
            return "NaN"
        }
        
        let lValue = NSDecimalNumber(string: self)
        let rValue = NSDecimalNumber(string: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        return lValue.subtracting(rValue, withBehavior: handle).stringValue
    }
    
    func multiplying(_ rhs: String, scale: Int16 = baseScale) -> String {
        EXPrint(#file+#function)
        
        guard Double(self) != nil else {
            EXPrint("\(self) is not number type")
            return "NaN"
        }
        guard Double(rhs) != nil else {
            EXPrint("\(rhs) is not number type")
            return "NaN"
        }
        
        let lValue = NSDecimalNumber(string: self)
        let rValue = NSDecimalNumber(string: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        return lValue.multiplying(by: rValue, withBehavior: handle).stringValue
    }
    
    func dividing(_ rhs: String, scale: Int16 = baseScale) -> String {
        EXPrint(#file+#function)
        
        guard Double(self) != nil else {
            EXPrint("\(self) is not number type")
            return "NaN"
        }
        guard Double(rhs) != nil else {
            EXPrint("\(rhs) is not number type")
            return "NaN"
        }
        
        let lValue = NSDecimalNumber(string: self)
        let rValue = NSDecimalNumber(string: rhs)
        
        let handle = NSDecimalNumberHandler.init(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        return lValue.dividing(by: rValue, withBehavior: handle).stringValue
    }
}

