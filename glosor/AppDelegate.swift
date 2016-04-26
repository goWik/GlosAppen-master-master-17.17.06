//
//  AppDelegate.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-10.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//icons:http://www.flaticon.com/free-icon/verify_55079
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navBar:UINavigationBar = UINavigationBar()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UINavigationBar.appearance().tintColor  = UIColor.whiteColor()
        
        let barAppearace = UIBarButtonItem.appearance()
        
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics:UIBarMetrics.Default)
        
        
        let navBackgroundImage:UIImage! = UIImage(named: "navBarRosaO.png")

        UINavigationBar.appearance().setBackgroundImage(navBackgroundImage, forBarMetrics: .Default)
        
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
   
    }

    func applicationDidEnterBackground(application: UIApplication) {
 
    }

    func applicationWillEnterForeground(application: UIApplication) {
     
    }

    func applicationDidBecomeActive(application: UIApplication) {
 
    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

