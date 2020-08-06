//
//  Extension-Dispatch-Queue.swift
//  iFGEX
//
//  Created by zhiyong yin on 2020/7/14.
//  Copyright © 2020 iFGEX. All rights reserved.
//

import Foundation

extension DispatchQueue {
    public func safeSync(execute block: () -> Void) {
        guard self == DispatchQueue.main else {
            self.sync(execute: block)
            return
        }
        if Thread.current.isMainThread {
            block()
        }else{
            self.sync(execute: block)
        }
    }
}
