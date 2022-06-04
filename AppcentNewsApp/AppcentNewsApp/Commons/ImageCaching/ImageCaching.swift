//
//  ImageCaching.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

protocol ImageCaching {}

private class ImageDate {
    let image: UIImage?
    let expirationDate: Date?
    
    init(image: UIImage?, expirationDate: Date?) {
        self.image = image
        self.expirationDate = expirationDate
    }
}

private let imageDateCache = NSCache<NSString, ImageDate>()

extension UIImageView: ImageCaching {}

extension ImageCaching where Self: UIImageView {
    
    typealias SuccessCompletion = (Bool) -> ()
    func image(from URLString: String, placeHolder: UIImage?) {
        
        self.image = nil
        let cacheKey = NSString(string: URLString)
        let currentDate = Date()
        if let cachedImageDate = imageDateCache.object(forKey: cacheKey) {
            if let expirationDate = cachedImageDate.expirationDate,
               currentDate > expirationDate {
                imageDateCache.removeObject(forKey: cacheKey)
            } else {
                self.image = cachedImageDate.image
                return
            }
        }
        
        self.image = placeHolder
        
        app.imageService.downloadImage(from: URLString) { [weak self] data in
            guard let self = self else { return }
            if let data = data,
               let downloadedImage = UIImage(data: data) {
                
                let imageDate = ImageDate(image: downloadedImage, expirationDate: currentDate.addingTimeInterval(app.imageCacheTimeInterval))
                
                imageDateCache.setObject(imageDate, forKey: NSString(string: URLString))
                
                DispatchQueue.main.async {
                    self.image = downloadedImage
                }
            }
        }
    }
}
