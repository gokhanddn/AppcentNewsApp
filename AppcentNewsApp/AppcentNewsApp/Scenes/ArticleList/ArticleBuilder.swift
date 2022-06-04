//
//  ArticleBuilder.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class ArticleBuilder {
    
    private static let storyboardName: String = "ArticleList"
    private static let controllerName: String = "ArticleListViewController"
    
    static func make() -> ArticleListViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName) as! ArticleListViewController
        viewController.viewModel = ArticleListViewModel(service: app.searchService)
        return viewController
    }
}
