//
//  ArticleDetailPresentation+Model.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import struct AppcentNewsAppModel.ArticleModel

extension ArticleDetailPresentation {
    
    convenience init(articleModel: ArticleModel) {
        self.init(sourceId: articleModel.source?.id ?? String(),
                  sourceName: articleModel.source?.name ?? String(),
                  author: articleModel.author ?? String(),
                  title: articleModel.title ?? String(),
                  desc: articleModel.description ?? String(),
                  sourceUrl: articleModel.sourceUrl ?? String(),
                  content: articleModel.content ?? String(),
                  imageUrl: articleModel.urlToImage ?? String(),
                  publishedDate: Util.getReadableDate(strDate: articleModel.publishedAt ?? String()))
    }
    
    convenience init(favoriteArticleModel: FavoriteArticle) {
        self.init(sourceId: favoriteArticleModel.sourceId ?? String(),
                  sourceName: String(),
                  author: favoriteArticleModel.author ?? String(),
                  title: favoriteArticleModel.title ?? String(),
                  desc: favoriteArticleModel.desc ?? String(),
                  sourceUrl: favoriteArticleModel.sourceUrl ?? String(),
                  content: favoriteArticleModel.content ?? String(),
                  imageUrl: favoriteArticleModel.imageUrl ?? String(),
                  publishedDate: favoriteArticleModel.publishedDate ?? String())
    }
}
