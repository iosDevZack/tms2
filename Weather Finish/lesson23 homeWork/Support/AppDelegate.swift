//
//  AppDelegate.swift
//  lesson23 homeWork
//
//  Created by Женя  on 8.09.21.
//

import UIKit
import AlamofireNetworkActivityLogger
import UserNotifications
import GoogleMaps
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDzwXFnSL68YqzPZ7RUGW0-MpPfsItJdGE")
        // Override point for customization after application launch.
        
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .red
        
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
        
        FirebaseApp.configure()
        
        
        return true
}

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

