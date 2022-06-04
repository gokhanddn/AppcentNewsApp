//
//  BaseService.swift
//  AppcentNewsAppService
//
//  Created by GOKHAN on 4.06.2022.
//

import Foundation
import Networking

public class BaseService {
    
    let networking: NetworkServiceProtocol
    
    public init() {
        networking = NetworkService()
    }
}
