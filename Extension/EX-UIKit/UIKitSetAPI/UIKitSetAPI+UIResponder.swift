//
//  UIKitSetAPI+UIResponder.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/5/23.
//

import UIKit


public extension UIResponder {
    
    @available(iOS 8.0, *)
    @discardableResult
    func userActivity(_ userActivity: NSUserActivity?) -> Self {
        self.userActivity = userActivity
        return self
    }
}
