//
//  AppDelegate.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 20/12/2022.
//

//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//}


import UIKit

@UIApplicationMain

class AppDelegate : UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
        -> Bool {
            
            if #available(iOS 13, *) {
                // do only pure app launch stuff, not interface stuff
            } else {
                
//                window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//                window?.windowScene = windowScene
                window?.rootViewController = StartVC()
                window?.makeKeyAndVisible()
                    
                configureNavigationBar()
                
                
            }
            return true
    }
}




