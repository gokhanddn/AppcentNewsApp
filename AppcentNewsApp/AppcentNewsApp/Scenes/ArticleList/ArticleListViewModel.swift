//
//  ArticleListViewModel.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core
import AppcentNewsAppService
import struct AppcentNewsAppModel.ArticleModel

final class ArticleListViewModel: ArticleListViewModelProtocol {
    
    // MARK: - Properties
    var delegate: ArticleListViewModelDelegate?
    private let service: SearchServiceProtocol
    private var articleList: [ArticleModel] = []
    private var totalResult: Int = 0
    
    // MARK: - Init
    init(service: SearchServiceProtocol) {
        self.service = service
    }
    
    // MARK: Protocol Methods
    func load(with searchText: String, in page: Int) {
        notify(.updateTitle(LanguageManager.shared.news))
        notify(.setLoading(true))
        
        let params: Parameters = [
            Constants.ParameterKeys.query: searchText,
            Constants.ParameterKeys.page: page
        ]
        
        if page == 1 {
            articleList.removeAll()
        }
        
        service.getSearchResultList(parameters: params) { [weak self] resp in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            if let resp = resp {
               if let articles = resp.articles {
                   self.totalResult = resp.totalResults ?? 0
                   self.articleList.append(contentsOf: articles)
               }
            } else {
                self.totalResult = self.articleList.count
            }
            
            let presenatations = self.articleList.map({ ArticlePresentation(articleModel: $0) })
            self.notify(.showArticleList(presenatations))
        }
    }
    
    func selectArticle(at index: Int) {
        let article = articleList[index]
        delegate?.navigate(to: .detail(ArticleDetailPresentation(articleModel: article)))
    }
    
    func isLoadingMoreVisible() -> Bool {
        return articleList.count != 0 && articleList.count < totalResult
    }
    
    // MARK: Private Methods
    private func notify(_ output: ArticleListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
