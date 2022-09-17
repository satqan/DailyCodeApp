////
////  ViewController.swift
////  Eventter
////
////  Created by Чингиз Саткан on 30.08.2022.
////
//
//import UIKit
//
//class TabBarController: UITabBarController {
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        generateTabBar()
//        setTabBarAppearance()
//    }
//    
//    // MARK: - Layout
//    private func generateTabBar(){
//        viewControllers = [
//            generateVC(viewController: HomeVC(),
//                       title: "Home",
//                       image: UIImage(systemName: "house.fill")),
//            generateVC(viewController: RatingVC(),
//                       title: "Rating",
//                       image: UIImage(systemName: "house.fill")),
//            generateVC(viewController: ProfileVC(),
//                       title: "Profile",
//                       image: UIImage(systemName: "person.fill")),
//        ]
//    }
//    // MARK: - Private Methods
//    
//    private func generateVC(viewController: UIViewController, title: String, image : UIImage?) -> UIViewController{
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        return viewController
//    }
//    
//    private func setTabBarAppearance(){
//        let positionOnX: CGFloat = 10
//        let positionOnY: CGFloat = 14
//        let width = tabBar.bounds.width - positionOnX * 2
//        let height = tabBar.bounds.height + positionOnY * 2
//        
//        
//        let roundLayer = CAShapeLayer()
//        
//        let bezierPath = UIBezierPath(
//            roundedRect : CGRect(
//                x: positionOnX,
//                y: tabBar.bounds.minY - positionOnY,
//                width: width,
//                height: height
//            ),
//            cornerRadius: height / 2
//        )
//        
//        roundLayer.path = bezierPath.cgPath
//        
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//        
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
//        
//        roundLayer.fillColor = UIColor.mainWhite.cgColor
//        tabBar.tintColor = .TabBarItemAccent
//        tabBar.unselectedItemTintColor = .tabBarItemLight
//    }
//
//}
//
