//
//  FavoriteListViewModel.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core
import struct AppcentNewsAppModel.ArticleModel

final class FavoriteListViewModel: FavoriteListViewModelProtocol {
    
    var delegate: FavoriteListViewModelDelegate?
    private var articleList: [FavoriteArticle] = []
    
    init() {}
    
    func load() {
        notify(.updateTitle(LanguageManager.shared.favorites))
        do {
            let favoriteArticleList: [FavoriteArticle] = try context.fetch(FavoriteArticle.fetchRequest())
            articleList = favoriteArticleList
            
            notify(.showArticleList(articleList.map { ArticlePresentation(favoriteArticleModel: $0) }))
        }
        catch {
            notify(.showArticleList([]))
        }
    }
    
    func selectArticle(at index: Int) {
        let article = articleList[index]
        delegate?.navigate(to: .detail(ArticleDetailPresentation(favoriteArticleModel: article)))
    }
    
    private func notify(_ output: FavoriteListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
