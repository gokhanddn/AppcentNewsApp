//
//  ArticleDetailPresentation.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

final class ArticleDetailPresentation: NSObject {
    
    let sourceId: String
    let sourceName: String
    let author: String
    let title: String
    let desc: String
    let sourceUrl: String
    let content: String
    let imageUrl: String
    let publishedDate: String
    
    init(sourceId: String, sourceName: String, author: String, title: String, desc: String, sourceUrl: String, content: String, imageUrl: String, publishedDate: String) {
        self.sourceId = sourceId
        self.sourceName = sourceName
        self.author = author
        self.title = title
        self.desc = desc
        self.sourceUrl = sourceUrl
        self.content = content
        self.imageUrl = imageUrl
        self.publishedDate = publishedDate
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? ArticleDetailPresentation else { return false }
        return self.sourceId == other.sourceId && self.sourceName == other.sourceName && self.imageUrl == other.imageUrl
    }
}
