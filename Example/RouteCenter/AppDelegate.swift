//
//  AppDelegate.swift
//  RouteCenter
//
//  Created by wangxiaotao on 07/07/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import RouteCenter
import URLNavigator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        RouteCenter.default.add(AmateurViewController.self)
        
//        RouteCenter.default.map(AppRoutePattern(pattern: "/items/<id>")) { (url, parameters) -> Bool in
//            guard let id = parameters["id"]?.intValue else {return false}
//            let controller = AmateurViewController()
//            let nickname = parameters["nickname"]
//            controller.title = "amateur item \(id) \(nickname!)"
//            UIViewController.topMost?.navigationController?.pushViewController(controller, animated: true)
//            return true
//        }
//
//        RouteCenter.default.map(AppRoutePattern(pattern: "/images")) { (url, parameters) -> Bool in
//            guard let keys = parameters["image_keys"] as? String else {return false}
//            let index = parameters["index"]?.intValue ?? 0
//            print("jump to controller images, keys = \(keys), index = \(index)")
//            return true
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return RouteCenter.default.route(url: url)
    }
}

