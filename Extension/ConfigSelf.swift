//
//  ConfigSelf.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/6/12.
//


/*
// MARK: - Test
import UIKit
extension ConfigSelf {
    func test() {
        let aView = UIView().config {
            $0.backgroundColor = .red
        }
        aView.addSubview(UILabel().config({
            $0.text = "text"
        }))
        print(aView)
    }
}
*/

public protocol ConfigSelf {}

public extension ConfigSelf {
    @inlinable
    func config(_ handle: (Self) throws -> Void) rethrows -> Self {
      try handle(self)
      return self
    }
}



