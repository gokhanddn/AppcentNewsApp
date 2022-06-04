//
//  BaseTabBarViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation
import UIKit

final class BaseTabBarViewController: UITabBarController {
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup & Initializers
    private func setup() {
        initView()
        initViewControllers()
    }
    
    func initViewControllers() {
        viewControllers = [
            createNavController(for: UIViewController(), title: "News", image: UIImage(systemName: "newspaper")!),
            createNavController(for: UIViewController(), title: "Favorites", image: UIImage(systemName: "heart")!)
        ]
    }
    
    private func initView() {
        self.navigationController?.isNavigationBarHidden = true
        setTabBarAppearance()
    }
    
    private func setTabBarAppearance() {
        UITabBar.appearance().backgroundColor = ThemeObject.current.tabBarBackground
        tabBar.backgroundImage = UIImage()

        tabBar.tintColor = ThemeObject.current.tabBarTint
        tabBar.unselectedItemTintColor = .lightGray
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
}
