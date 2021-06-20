//
//  AppDelegate.swift
//  EXDemo
//
//  Created by Tyler.Yin on 2018/9/8.
//  Copyright © 2018年 ayong. All rights reserved.
//

import UIKit
import EX

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let aaa: Double = 0.89
        let bbb: Float = 0.66
        let ccc: CGFloat = 0.88
        let ddd: Int = 100
        
        
        let timestamp3 = Date().timeIntervalSince1970
        for i in 0...10000000 {
            //let aaaa = aaa.toString()
            let bbbb = bbb.toString()
            let dddd = ddd.toString()
        }
        let timestamp4 = Date().timeIntervalSince1970
        print("timestamp4-timestamp3=\(timestamp4-timestamp3)")
                
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

