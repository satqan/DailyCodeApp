//
//  AppCenter.swift
//  Eventter
//
//  Created by Чингиз Саткан on 17.09.2022.
//

import UIKit

class AppCenter {
    private var window: UIWindow = UIWindow()
    
    var mainController: UIViewController?

    static let shared = AppCenter()

    func createWindow(_ window: UIWindow, application: UIApplication) -> Void {
        self.window = window
    }

    private func makeKeyAndVisible() -> Void {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
    }

    func setRootController(_ controller: UIViewController) -> Void {
        window.rootViewController = controller
    }

    func start() -> Void {
        makeKeyAndVisible()
        makeRootController()
    }

    func makeRootController() -> Void {
        UserSessionManager.shared.setCurrentUser(user: User(
            photo: UIImage(systemName: "photo.circle.fill"),
            first_name: "Shyngys",
            last_name: "Satkan",
            leetcode_username: "ssatkan"
        ))
        let isLoggedIn = UserSessionManager.shared.currentUser != nil
//        let usrData = UserSessionManager.shared.getCurrentUser()
        
        if isLoggedIn {
            window.rootViewController = createTabBar()
        } else {
            window.rootViewController = LoginVC()
        }
    }
    
    private func createTabBar() -> UIViewController {
        let tabBar = UITabBarController()
        
        let homeVC = UINavigationController(rootViewController: HomeVC())
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill")?.withRenderingMode(.automatic), tag: 0)
        
        let ticketsVC = UINavigationController(rootViewController: RatingVC())
        ticketsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "circle.fill")?.withRenderingMode(.automatic), tag: 1)
        
        let profileVC = UINavigationController(rootViewController: ProfileVC())
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.fill")?.withRenderingMode(.automatic), tag: 2)

        tabBar.viewControllers = [homeVC, ticketsVC, profileVC]
        
        return tabBar
    }
}

