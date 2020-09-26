//
//  AppDelegate.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/20/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    let locationService = LocationService()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<RapidServices.BussienessProvider>()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        service.request(.search(lat: 37.7749, long: 122.4194)) { (result) in
            switch result{
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
            case .failure(let error):
                print(error)
            }
        }
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

