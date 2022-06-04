//
//  ArticlePresentation+Model.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import struct AppcentNewsAppModel.ArticleModel

extension ArticlePresentation {
    
    convenience init(newsModel: ArticleModel) {
        self.init(
            title: newsModel.title ?? String(),
            desc: newsModel.description ?? String(),
            imageUrl: newsModel.urlToImage ?? String()
        )
    }
}
