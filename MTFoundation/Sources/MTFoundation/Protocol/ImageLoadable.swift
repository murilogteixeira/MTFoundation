//
//  ImageLoadable.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public protocol ImageLoadable {
    var image: UIImage? { get set }
    mutating func loadImage(from url: URL, whileLoadingShow placeholder: UIImage?, completion: (() -> Void)?)
    func swapImage(to image: UIImage)
}

public extension ImageLoadable {
    mutating func loadImage(
        from url: URL,
        whileLoadingShow placeholder: UIImage? = nil,
        completion: (() -> Void)? = nil
    ) {
        let image = ImageCache.shared.getImage(from: url.absoluteString)
        if let image = image {
            self.image = image
        }
        else {
            swapImage(to: placeholder ?? UIImage())
            ImageCache.shared.load(from: url, to: self)
        }
        completion?()
    }
    
    mutating func swapImage(to image: UIImage) {
        self.image = image
    }
}

public extension ImageLoadable where Self: UIView {
    func swapImage(to image: UIImage) {
        DispatchQueue.main.async {
            UIView.transition(
                with: self, duration: 0.5, options: .transitionCrossDissolve,
                animations: { [weak self] in
                    self?.image = image
                }
            )
        }
    }
}

extension UIImageView: ImageLoadable {}
