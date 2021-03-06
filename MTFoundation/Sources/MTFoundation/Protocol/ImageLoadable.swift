//
//  ImageLoadable.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public protocol ImageLoadable: AnyObject {
    var image: UIImage? { get set }
    func loadImage(from url: URL, whileLoadingShow placeholder: UIImage?, completion: (() -> Void)?)
    func swapImage(to image: UIImage)
}

public extension ImageLoadable {
    func loadImage(
        from url: URL,
        whileLoadingShow placeholder: UIImage? = nil,
        completion: (() -> Void)? = nil
    ) {
        let image = ImageCache.shared.getImage(from: url.path)
        self.image = image ?? placeholder
        if image == nil { ImageCache.shared.load(from: url, into: self) }
        completion?()
    }
    
    func swapImage(to image: UIImage) {
        self.image = image
    }
}

public extension ImageLoadable where Self: UIView {
    func swapImage(to image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
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
