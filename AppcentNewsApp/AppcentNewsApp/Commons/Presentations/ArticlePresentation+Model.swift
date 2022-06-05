//
//  ArticlePresentation+Model.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import struct AppcentNewsAppModel.ArticleModel

extension ArticlePresentation {
    
    convenience init(articleModel: ArticleModel) {
        self.init(
            title: articleModel.title ?? String(),
            desc: articleModel.description ?? String(),
            imageUrl: articleModel.urlToImage ?? String()
        )
    }
    
    convenience init(favoriteArticleModel: FavoriteArticle) {
        self.init(title: favoriteArticleModel.title ?? String(),
                  desc: favoriteArticleModel.desc ?? String(),
                  imageUrl: favoriteArticleModel.imageUrl ?? String())
    }
}
