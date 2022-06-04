//
//  ArticleModel.swift
//  AppcentNewsAppModel
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation

public struct ArticleModel: Decodable {
    public let source: SourceModel?
    public let author: String?
    public let title: String?
    public let description: String?
    public let sourceUrl: String?
    public let urlToImage: String?
    public let publishedAt: String?
    public let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case sourceUrl = "url"
        case urlToImage
        case publishedAt
        case content
    }
}
