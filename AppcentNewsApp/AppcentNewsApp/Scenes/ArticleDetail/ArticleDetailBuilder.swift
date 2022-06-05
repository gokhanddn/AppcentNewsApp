//
//  ArticleDetailBuilder.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class ArticleDetailBuilder {
    
    private static let storyboardName: String = "ArticleDetail"
    private static let controllerName: String = "ArticleDetailViewController"
    
    static func make(with article: ArticleDetailPresentation) -> ArticleDetailViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName) as? ArticleDetailViewController
        viewController?.viewModel = ArticleDetailViewModel(article: article)
        return viewController
    }
}
