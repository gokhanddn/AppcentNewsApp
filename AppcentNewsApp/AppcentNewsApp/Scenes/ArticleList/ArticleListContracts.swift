//
//  ArticleListContracts.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import AppcentNewsAppModel

protocol ArticleListViewModelProtocol {
    var delegate: ArticleListViewModelDelegate? { get set }
    func load(with searchText: String, in page: Int)
    func selectArticle(at index: Int)
    func isLoadingMoreVisible() -> Bool
}

enum ArticleListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showArticleList([ArticlePresentation])
}

enum ArticleListViewRoute {
    case detail(ArticleDetailPresentation)
}

protocol ArticleListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ArticleListViewModelOutput)
    func navigate(to route: ArticleListViewRoute)
}
