//
//  SearchServiceProtocol.swift
//  AppcentNewsAppService
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation
import Core
import AppcentNewsAppModel

public protocol SearchServiceProtocol {
    func getSearchResultList(parameters: Parameters, completion: @escaping CallbackResponse<SearchNewsResponse>)
}
