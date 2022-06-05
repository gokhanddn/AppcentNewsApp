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
    
    // MARK: Private Methods
    private func notify(_ output: ArticleDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
