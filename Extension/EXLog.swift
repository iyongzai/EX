//
//  Util.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/3/29.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation

public enum EXLogType {
    case close
    case print
    case debugPrint
}
public var exLogType = EXLogType.close
public func EXPrint(_ items: Any...) {
    switch exLogType {
    case .close:
        return
    case .print:
        print(items)
    case .debugPrint:
        debugPrint(items)
    }
}
