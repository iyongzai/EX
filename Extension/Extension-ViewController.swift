//
//  Extension-ViewController.swift
//  iVCoin
//
//  Created by ayong on 2017/12/18.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import UIKit
import SwiftyJSON

var refreshingToken = false

// MARK: - 登录跳转
extension UIViewController {
    func loginNavC() -> AYNavViewController {
        return UIStoryboard.init(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "loginIndex") as! AYNavViewController
    }
    func gotoLogin(_ loginSuccess: (()->Void)? = nil, _ cancelHandle: (()->Void)? = nil) {
        let loginNavC = UIStoryboard.init(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "loginIndex") as! AYNavViewController
        let loginVC = loginNavC.viewControllers[0] as! AYLoginViewController
        loginVC.loginSuccess = loginSuccess
        loginVC.cancelHandle = cancelHandle
        self.present(loginNavC, animated: true, completion: nil)
        
        return
    }
    func dismissLoginOrRegVC() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}


// MARK: - 刷新token
extension UIViewController {
    func refreshToken() {
        guard !refreshingToken else {
            return
        }
        refreshingToken = true
        let vcIdentifier = self as? AYNetworkingVProtocol ?? "refreshToken"
        AYNetworking.share.get(path: "\(uHost)/refreshToken", parameters: nil, vcIdentifier: vcIdentifier, requestContext: nil, success: { (result: JSON, requestContext: Dictionary<String, Any>?) in
            print("刷新token成功")
            if let access_token = result["access_token"].string, let expire = result["expire"].string, Int(expire) != nil {
                BaseSingleton.share.loginer.token = access_token
                BaseSingleton.share.loginer.expire = Int64(expire)
                BaseSingleton.share.loginer.lastLoginTime = Int64(Date.init().timeIntervalSince1970*1000)
                BaseSingleton.share.save()
            }
        }, failure: { (error: AYNetworkingError, requestContext: Dictionary<String, Any>?) in
            print("刷新token失败")
        }, finally: { (requestContext: Dictionary<String, Any>?) in
            refreshingToken = false
        })
    }
}
