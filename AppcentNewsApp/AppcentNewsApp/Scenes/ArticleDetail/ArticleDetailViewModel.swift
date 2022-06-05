//
//  ArticleDetailViewModel.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core

final class ArticleDetailViewModel: ArticleDetailViewModelProtocol {
    
    // MARK: - Properties
    var delegate: ArticleDetailViewModelDelegate?
    private let article: ArticleDetailPresentation
    
    // MARK: - Init
    init(article: ArticleDetailPresentation) {
        self.article = article
    }
    
    // MARK: Protocol Methods
    func load() {
        notify(.updateTitle(LanguageManager.shared.newsDetail))
        notify(.showArticleDetail(article))
    }
    
    func addOrRemoveFavorite() {
        do {
            let favoriteArticleList: [FavoriteArticle] = try context.fetch(FavoriteArticle.fetchRequest())
            let favorite = favoriteArticleList.filter { $0.sourceUrl == article.sourceUrl }
            
            if favorite.count > 0 {
                removeFromFavorites(article: favorite[0])
            } else {
                addToFavorites()
            }
        }
        catch {
            print("An error occured")
        }
    }
    
    func isFavorite() -> Bool {
        do {
            let favoriteArticleList: [FavoriteArticle] = try context.fetch(FavoriteArticle.fetchRequest())
            return favoriteArticleList.filter { $0.sourceUrl == article.sourceUrl }.count > 0
        }
        catch {
            return false
        }
    }
    
    // MARK: Private Methods
    private func addToFavorites() {
        let favoriteArticle = FavoriteArticle(context: context)
        favoriteArticle.sourceId = article.sourceId
        favoriteArticle.sourceUrl = article.sourceUrl
        favoriteArticle.title = article.title
        favoriteArticle.desc = article.desc
        favoriteArticle.content = article.content
        favoriteArticle.imageUrl = article.imageUrl
        favoriteArticle.publishedDate = article.publishedDate
        
        saveContext()
    }
    
    private func removeFromFavorites(article: FavoriteArticle) {
        context.delete(article)
        saveContext()
    }
    
    private func saveContext() {
        do{
            try context.save()
            notify(.updatedFavorite(true))
        }
        catch {
            print("An error occured")
            notify(.updatedFavorite(false))
        }
    }
    
    private func notify(_ output: ArticleDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
