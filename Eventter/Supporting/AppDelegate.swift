//
//  AppDelegate.swift
//  Eventter
//
//  Created by Чингиз Саткан on 30.08.2022.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppCenter.shared.start()
        return true
    }
}

