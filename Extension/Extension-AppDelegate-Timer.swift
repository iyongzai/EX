//
//  Extension-AppDelegate-Timer.swift
//  iVCoin
//
//  Created by Tyler.Yin on 2018/1/16.
//  Copyright © 2018年 阿勇. All rights reserved.
//

import Foundation

extension AppDelegate {
    func startTimer(seconds: Int) {
        /// 创建 gcd timer.
        timerSource?.cancel()
        timerSource = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timerSource?.schedule(deadline: .now(), repeating: .seconds(seconds))
        // 设定时间源的触发事件
        timerSource?.setEventHandler(handler: {
            BaseSingleton.share.getAssets()
        })
        // 启动时间源
        timerSource?.resume()
    }
}
