//
//  AppDelegate.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/20/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    let locationService = LocationService()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        switch locationService.status {
               case .notDetermined, .restricted, .denied:
                let locationViewController = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
                locationViewController?.locationService = locationService
                window.rootViewController = locationViewController
               default:
                  assertionFailure()
               }
        window.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }


}

