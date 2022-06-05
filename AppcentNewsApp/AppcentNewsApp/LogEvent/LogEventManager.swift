//
//  LogEventManager.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core
import Firebase

final class LogEventManager {
    
    static let shared = LogEventManager()
    
    func logEvent(name: String, params: Parameters?) {
        Analytics.logEvent(name, parameters: params)
    }
}
