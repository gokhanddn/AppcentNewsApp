//
//  AppRouter.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 4.06.2022.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(with scene: UIWindowScene) {
        let tabBar = BaseTabBarViewController()
        self.window.rootViewController = tabBar
        window.makeKeyAndVisible()
        window.windowScene = scene
    }
}
