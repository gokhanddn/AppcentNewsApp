//
//  FavoriteListBuilder.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class FavoriteListBuilder {
    
    private static let storyboardName: String = "FavoriteList"
    private static let controllerName: String = "FavoriteListViewController"
    
    static func make() -> FavoriteListViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName) as? FavoriteListViewController
        viewController?.viewModel = FavoriteListViewModel()
        return viewController
    }
}
