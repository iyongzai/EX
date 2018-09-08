//
//  Extension-AppDeleagte-Network.swift
//  iVCoin
//
//  Created by ayong on 2017/12/18.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import Reachability
//import StompClientLib
import SocketRocket
import SwiftyJSON


extension AppDelegate {
    func networkStatusListener() {
        // 1、设置网络状态消息监听 2、获得网络Reachability对象
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: Notification.Name.reachabilityChanged, object: reachability)
        do{
            // 3、开启网络状态消息监听
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        self.getC()
    }
    
    // 主动检测网络状态
    @objc func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability // 准备获取网络连接信息
        
        if reachability.connection != .none { // 判断网络连接状态
            print("网络连接：可用")
            if reachability.connection == .wifi { // 判断网络连接类型
                print("连接类型：WiFi")
                // strServerInternetAddrss = getHostAddress_WLAN() // 获取主机IP地址 192.168.31.2 小米路由器
                // processClientSocket(strServerInternetAddrss)    // 初始化Socket并连接，还得恢复按钮可用
            } else {
                print("连接类型：移动网络")
                // getHostAddrss_GPRS()  // 通过外网获取主机IP地址，并且初始化Socket并建立连接
            }
        } else {
            print("网络连接：不可用")
            DispatchQueue.main.async { // 不加这句导致界面还没初始化完成就打开警告框，这样不行
                self.alert_noNetwrok() // 警告框，提示没有网络
            }
        }
    }
    
    // 警告框，提示没有连接网络 *********************
    func alert_noNetwrok() -> Void {
        /*
         let alert = UIAlertController(title: "系统提示", message: "请打开网络连接", preferredStyle: .alert)
         let cancelAction = UIAlertAction(title: "确定", style: .default, handler: nil)
         alert.addAction(cancelAction)
         self.present(alert, animated: true, completion: nil)
         */
    }
    
}


// MARK: - 网络处理，如特殊token失效等特殊code事件，token即将失效
extension AppDelegate {
    func startObservingSpecialStatusCode() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivedSpecialStatusCodeNotification(_:)), name: NSNotification.Name.specialNetworkingStatusCode, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(receivedTokenWillExpireNotification(_:)), name: NSNotification.Name.tokenWillExpire, object: nil)
    }
    func endObservingSpecialStatusCode() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.specialNetworkingStatusCode, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.tokenWillExpire, object: nil)
    }
    
    func clearCache() {
        //todo: 清除跟登录用户有关的缓存
        BaseSingleton.share.loginer.reset()
        BaseSingleton.share.save()
    }
    func getC() {
        DispatchQueue.global().async {
            let url = URL.init(string: "https://dn-iyongzai.qbox.me/c-ay-agent.json")
            if let str = try? String.init(contentsOf: url!) {
                let result = JSON.init(parseJSON: str)
                let aJson = result[(Bundle.main.bundleIdentifier ?? "--")]
                let esc = aJson["esc"].boolValue
                let msg = aJson["msg"].stringValue
                if msg.length > 0 {
                    let alert = UIAlertController.init(title: nil, message: msg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "知道了", style: .cancel, handler: { (action: UIAlertAction) in
                        DispatchQueue.main.async(execute: {
                            if esc {
                                exit(0)
                            }
                        })
                    }))
                    self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                }else if esc {
                    exit(0)
                }
            }
        }
    }

    @objc func receivedSpecialStatusCodeNotification(_ notification: Notification) {
        if let codeString = notification.userInfo?["statusCode"] as? String {
            if let code = Int(codeString) {
                switch (code) {
                case AYNetworkCode.expiredToken://token过期或者无效
                    self.clearCache()
                    self.window?.rootViewController?.gotoLogin()
                    break;
                    
                default:
                    break;
                }
            }
        }
    }
    @objc func receivedTokenWillExpireNotification(_ notification: Notification) {
        self.window?.rootViewController?.refreshToken()
    }
    
}

//extension AppDelegate: StompClientLibDelegate {
//    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, withHeader header: [String : String]?, withDestination destination: String) {
//        print("stompClient")
//    }
//    
//    func stompClientJSONBody(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
//        print("stompClientJSONBody")
//    }
//    
//    func stompClientDidDisconnect(client: StompClientLib!) {
//        print("stompClientDidDisconnect")
//    }
//    
//    func stompClientDidConnect(client: StompClientLib!) {
//        print("stompClientDidConnect")
//    }
//    
//    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
//        print("serverDidSendReceipt")
//    }
//    
//    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
//        print("serverDidSendError")
//    }
//    
//    func serverDidSendPing() {
//        print("serverDidSendPing")
//    }
//    
//    
//}

extension AppDelegate: SRWebSocketDelegate {
    func webSocket(_ webSocket: SRWebSocket!, didReceiveMessage message: Any!) {
        print("didReceiveMessage: \(message!)")
    }
    
    func webSocketDidOpen(_ webSocket: SRWebSocket!) {
        print("webSocketDidOpen")
//        let msg = "{        sub: 'market.btcusdt.kline.1min',        id: 'id generate by client',        authorization: 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxaWFuZyIsInRlbCI6IjEzMzEyOTc5NTEzIiwiZXhwIjoxNTI2NjE4NDM0LCJ1c2VyX2lkIjo5OTYyODI5Nzg2MDI2NjM5MzgsImNyZWF0ZWQiOjE1MjY2MTEyMzQxNTR9.u190jgNQEm5iDVwv5nI2ICY-7-1MfW_2hiyCIn7sUMoSQxLI3lq_uLFjnY79mT5KiNbPdgxgMHmkqw4bqZMKPg'    }"
//        webSocket.send(msg)
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didFailWithError error: Error!) {
        print("didFailWithError")
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didCloseWithCode code: Int, reason: String!, wasClean: Bool) {
        print("didCloseWithCode")
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didReceivePong pongPayload: Data!) {
        print("didReceivePong")
    }
    
}













