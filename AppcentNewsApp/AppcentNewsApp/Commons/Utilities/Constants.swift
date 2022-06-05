//
//  Constants.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation

final class Constants {
    
    // MARK: - Keys
    struct Keys {
        static let englishLocalization = "en"
        static let turkishLocalization = "tr"
    }
    
    // MARK: - ReuseIdentifiers
    struct ReuseIdentifiers {
        static let articleCell = "ArticleCell"
        static let loadingMore = "LoadingMoreFooterView"
    }
    
    // MARK: - ParameterKeys
    struct ParameterKeys {
        static let query = "q"
        static let page = "page"
    }
    
    // MARK: - ParameterKeys
    struct AnalyticsEventName {
        static let searchedText = "searched_text"
        static let articleDetail = "article_detail"
    }
}
