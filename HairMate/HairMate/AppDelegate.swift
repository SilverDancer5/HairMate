//
//  AppDelegate.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/12.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //message tab相关设置
        let messageViewController = MessageViewController()
        messageViewController.tabBarItem.title = "社区"
        messageViewController.tabBarItem.image = UIImage(named: "message")//?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        messageViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        //main tab相关设置
        let mainViewController = MainViewController()
        mainViewController.tabBarItem.title = "主页"
        mainViewController.tabBarItem.image = UIImage(named: "main")//?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        mainViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        //user tab相关设置
        let userViewController = UserViewController()
        userViewController.tabBarItem.title = "用户"
        userViewController.tabBarItem.image = UIImage(named: "user")//?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        userViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        //将三个tabh加入控制器中
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [messageViewController, mainViewController, userViewController]
        tabViewController.selectedIndex = 1//设置加载为index0
        self.window?.rootViewController = tabViewController
        
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

