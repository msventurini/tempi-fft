//
//  AppDelegate.swift
//  TempiHarness
//
//  Created by John Scalo on 1/7/16.
//  Copyright © 2016 John Scalo. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
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

    func application(
         _ application: UIApplication,
         configurationForConnecting connectingSceneSession: UISceneSession,
         options: UIScene.ConnectionOptions
     ) -> UISceneConfiguration {


         // Each `UISceneConfiguration` must have a unique configuration name
         // that corresponds to an entry in the information property list scene manifest.
         let configurationName: String


//         switch options.userActivities.first?.activityType {
//         case UserActivity.GalleryOpenInspectorActivityType:
//             // Create a photo inspector window scene.
//             configurationName = "Inspector Configuration"
//         default:
//             // Create a default gallery window scene.
             configurationName = "Default Configuration"
//         }


         return UISceneConfiguration(
             name: configurationName,
             sessionRole: connectingSceneSession.role
         )
     }

}



