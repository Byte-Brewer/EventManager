//
//  AppDelegate.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/10/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
//        let maskView = UIImageView(frame: window!.frame)
//        maskView.image = UIImage(named: "log5")
//        maskView.contentMode = .scaleAspectFit
//        maskView.tag = 2020
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = window!.frame
        blurEffectView.tag = 2019
//        self.window?.addSubview(maskView)
        self.window?.addSubview(blurEffectView)
        print("Function: \(#function), line: \(#line)")
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Function: \(#function), line: \(#line)")
        self.window?.viewWithTag(2019)?.removeFromSuperview()
        self.window?.viewWithTag(2020)?.removeFromSuperview()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        application.ignoreSnapshotOnNextApplicationLaunch()
        print("Function: \(#function), line: \(#line)")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Function: \(#function), line: \(#line)")
        self.window?.viewWithTag(2019)?.removeFromSuperview()
        self.window?.viewWithTag(2020)?.removeFromSuperview()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Function: \(#function), line: \(#line)")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

func DLog(message: String, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
    print("\(file) : \(function) : \(line) : \(column) - \(message)")
}

func printLog(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let className = file.components(separatedBy: "/").last
    print(" ❌ Error ----> File: \(className ?? ""), Function: \(function), Line: \(line), Message: \(message)")
    #endif
}

