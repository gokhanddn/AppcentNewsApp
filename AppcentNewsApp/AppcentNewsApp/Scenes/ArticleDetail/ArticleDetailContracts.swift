//
//  ArticleDetailContracts.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

protocol ArticleDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ArticleDetailViewModelOutput)
}

enum ArticleDetailViewModelOutput: Equatable {
    case updateTitle(String)
    case showArticleDetail(ArticleDetailPresentation)
    case updatedFavorite(Bool)
}

protocol ArticleDetailViewModelProtocol {
    var delegate: ArticleDetailViewModelDelegate? { get set }
    func load()
    func addOrRemoveFavorite()
    func isFavorite() -> Bool
}
