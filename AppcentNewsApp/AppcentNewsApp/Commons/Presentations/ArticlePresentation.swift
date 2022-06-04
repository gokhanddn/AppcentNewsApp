//
//  ArticlePresentation.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

final class ArticlePresentation: NSObject {
    
    let title: String
    let desc: String
    let imageUrl: String
    
    init(title: String, desc: String, imageUrl: String) {
        self.title = title
        self.desc = desc
        self.imageUrl = imageUrl
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? ArticlePresentation else { return false }
        return self.title == other.title && self.desc == other.desc && self.imageUrl == other.imageUrl
    }
}
