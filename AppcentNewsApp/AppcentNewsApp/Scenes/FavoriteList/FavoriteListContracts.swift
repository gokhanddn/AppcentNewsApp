//
//  FavoriteListContracts.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import AppcentNewsAppModel

protocol FavoriteListViewModelProtocol {
    var delegate: FavoriteListViewModelDelegate? { get set }
    func load()
    func selectArticle(at index: Int)
}

enum FavoriteListViewModelOutput: Equatable {
    case updateTitle(String)
    case showArticleList([ArticlePresentation])
}

enum FavoriteListViewRoute {
    case detail(ArticleDetailPresentation)
}

protocol FavoriteListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: FavoriteListViewModelOutput)
    func navigate(to route: FavoriteListViewRoute)
}
