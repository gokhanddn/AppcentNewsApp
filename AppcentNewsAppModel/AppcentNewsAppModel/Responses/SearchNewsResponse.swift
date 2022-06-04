//
//  SearchNewsResponse.swift
//  AppcentNewsAppModel
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation

public struct SearchNewsResponse: Decodable {
    public let status: String?
    public let totalResults: Int?
    public let articles: [ArticleModel]?
}
