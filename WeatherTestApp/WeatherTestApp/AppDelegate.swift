//
//  AppDelegate.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let builder = WeatherBuilder()
        let rootViewController = builder.build()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
