//
//  ImageCache.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public final class ImageCache {
    static let shared = ImageCache()
    private init() {}
    
    private var cache = NSCache<NSString, UIImage>()
    
    func setImage(from url: URL, in location: ImageLoadable, completion: ((UIImage) -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            if let image = self?.cache.object(forKey: url.path as NSString) {
                location.swapImage(to: image)
                completion?(image)
            } else {
                UIImage.load(from: url) { result in
                    switch result {
                    case .success(let image):
                        self?.cache.setObject(image, forKey: url.path as NSString)
                        location.swapImage(to: image)
                        completion?(image)
                    case .failure(let error):
                        print("Image load from URL failure: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
