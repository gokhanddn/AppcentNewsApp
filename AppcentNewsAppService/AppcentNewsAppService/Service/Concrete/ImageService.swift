//
//  ImageService.swift
//  AppcentNewsAppService
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import Core
import Networking

public class ImageService: BaseService, ImageServiceProtocol {
    
    public override init() {
        super.init()
    }
    
    public func downloadImage(from urlString: String, completion: @escaping CallbackResponse<Data>) {
        
        networking.download(with: urlString) { (result: Result<Data>) in
            
            switch result {
            case .failure(_):
                completion(nil)
                return
            case .success(let data):
                completion(data)
                return
            }
        }
    }
}
