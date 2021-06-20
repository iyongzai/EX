//
//  EX+UIView.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/5/22.
//

import UIKit

public extension UIView {
    func add(subview: UIView) -> Self {
        self.addSubview(subview)
        return self
    }
}
