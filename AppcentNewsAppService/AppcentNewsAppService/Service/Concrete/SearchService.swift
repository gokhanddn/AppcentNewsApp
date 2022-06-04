//
//  SearchService.swift
//  AppcentNewsAppService
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation
import Core
import Networking
import AppcentNewsAppModel

public class SearchService: BaseService, SearchServiceProtocol {
    
    public override init() {
        super.init()
    }
    
    public func getSearchResultList(parameters: Parameters, completion: @escaping CallbackResponse<SearchNewsResponse>) {
        
        var dataRequest = DataRequest(urlString: ApiHost.production.rawValue, path: .search, version: .v2)
        dataRequest.method = .get
        dataRequest.params = parameters
        
        networking.request(with: dataRequest.getUrlRequest(with: "everything")) { (result: Result<SearchNewsResponse>) in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
