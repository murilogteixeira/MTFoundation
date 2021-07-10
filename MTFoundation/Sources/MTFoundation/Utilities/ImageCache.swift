//
//  ImageCache.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public final class ImageCache {
    public static let shared = ImageCache()
    private init() {}
    
    private var cache = NSCache<NSString, UIImage>()
    
    public func getImage(from url: String) -> UIImage? {
        cache.object(forKey: url as NSString)
    }
    
    public func load(from url: URL, into imageView: ImageLoadable) {
        DispatchQueue.main.async { [weak self] in
            if let image = self?.getImage(from: url.absoluteString) {
                imageView.image = image
            } else {
                UIImage.load(from: url) { result in
                    switch result {
                    case .success(let image):
                        self?.cache.setObject(image, forKey: url.path as NSString)
                        imageView.swapImage(to: image)
                    case .failure(let error):
                        print("Image load from URL failure: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
