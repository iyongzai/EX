//
//  Extension-AppDelegate-InitSDK.swift
//  iVCoin
//
//  Created by Tyler.Yin on 2018/3/17.
//  Copyright © 2018年 阿勇. All rights reserved.
//

import Foundation

extension AppDelegate {
    func configureBugtags() {
        Bugtags.start(withAppKey: "e33a5921f21acae08a3b53760248c637", invocationEvent: BTGInvocationEventBubble)
    }
    
    func checkVersionFromPgyer() {
        var PGY_APP_ID = ""
        switch Bundle.main.bundleIdentifier {
        case "com.ayong.dev.jiaoyibase":
            PGY_APP_ID = "030d263fc6126a01a87f9f37f0b7015d"
        case "com.ayong.dev.bhao":
            PGY_APP_ID = "e4db264a6e535a67682e4525640586de"
        case "com.ayong.dev.zb":
            PGY_APP_ID = ""
        case "com.ayong.dev.pcn":
            PGY_APP_ID = "8d6a7caba494647b047b39c033432798"
        case "com.ayong.dev.bxx":
            PGY_APP_ID = ""
        default:
            break
        }
        if PGY_APP_ID.length > 0 {
            PgyManager.shared().start(withAppId: PGY_APP_ID)
            PgyUpdateManager.sharedPgy().start(withAppId: PGY_APP_ID)
            PgyManager.shared().isFeedbackEnabled = false
            PgyUpdateManager.sharedPgy().checkUpdate()
        }
    }
}
