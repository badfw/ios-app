//
//  AppDelegate.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import UIKit
import SideMenu
import Firebase
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?
    var sideMenu : SideMenuViewController!
    let gcmMessageKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        if let window = self.window {
            let welcomeViewController = WelcomeViewController.instantiateFromStoryboard()
            let navigationController = UINavigationController.init(rootViewController: welcomeViewController)
            window.rootViewController = navigationController
            sideMenu = SideMenuViewController.instantiateFromStoryboard()
            sideMenu.associatedNavigationController = navigationController
            sideMenu.welcomeViewController = welcomeViewController
            sideMenu.upcomingEventsViewController = UpcomingEventsViewController.instantiateFromStoryboard()
            sideMenu.adminViewController = AdminViewController.instantiateFromStoryboard()
            sideMenu.contactViewController = ContactViewController.instantiateFromStoryboard()
            sideMenu.contactViewController?.sideMenuViewController = sideMenu
            SideMenuManager.default.menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenu)
            /*
            Side menu customization
             
            SideMenuManager.default.menuPresentMode = .viewSlideInOut
            SideMenuManager.default.menuBlurEffectStyle = .light
             */
            window.makeKeyAndVisible()
        }
        FirebaseApp.configure()
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
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

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications with error \(error.localizedDescription)")
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Application registered for remote notifications... device token=\(deviceToken)")
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("Received remote notification")
        if let messageID = userInfo[gcmMessageKey] {
            print("- Message ID: \(messageID)")
        } else {
            print("- No message ID")
        }
        print(" - UserInfo: \(userInfo)")
        completionHandler(.newData)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if let message = userInfo[gcmMessageKey] {
            print("- Message ID: \(message)")
        } else {
            print("- No message ID")
        }
        print("- UserInfo: \(userInfo)")
        completionHandler(.alert)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let message = userInfo[gcmMessageKey] {
            print("- Message ID: \(message)")
        } else {
            print("- No message ID")
        }
        print("- UserInfo: \(userInfo)")
        completionHandler()
    }
}

