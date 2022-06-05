//
//  AppContainer.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 4.06.2022.
//

import UIKit
import AppcentNewsAppService

let app = AppContainer()
let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

final class AppContainer {
    
    let router = AppRouter()
    let searchService = SearchService()
    let imageService = ImageService()
    let imageCacheTimeInterval: TimeInterval = 12 * 60 * 60
}
