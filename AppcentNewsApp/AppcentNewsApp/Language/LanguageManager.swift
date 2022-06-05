//
//  LanguageManager.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class LanguageManager {
    
    static let shared = LanguageManager()
    
    // MARK: - TabBar
    var news: String = TabBarLocalize.news.rawValue.localized(LanguageObject.locale)
    var favorites: String = TabBarLocalize.favorites.rawValue.localized(LanguageObject.locale)
    
    // MARK: - General
    var loadMore: String = GeneralLocalize.loadMore.rawValue.localized(LanguageObject.locale)
    var search: String = GeneralLocalize.search.rawValue.localized(LanguageObject.locale)
    var newsDetail: String = GeneralLocalize.newsDetail.rawValue.localized(LanguageObject.locale)
    var desc: String = GeneralLocalize.desc.rawValue.localized(LanguageObject.locale)
    var goSource: String = GeneralLocalize.goSource.rawValue.localized(LanguageObject.locale)
}

enum TabBarLocalize: String {
    case news
    case favorites
}

enum GeneralLocalize: String {
    case loadMore
    case search
    case newsDetail
    case desc
    case goSource
}
