//
//  ImageServiceProtocol.swift
//  AppcentNewsAppService
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core

public protocol ImageServiceProtocol {
    func downloadImage(from urlString: String, completion: @escaping CallbackResponse<Data>)
}
