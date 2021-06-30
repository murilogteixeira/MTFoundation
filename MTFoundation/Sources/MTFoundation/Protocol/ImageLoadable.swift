//
//  ImageLoadable.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public protocol ImageLoadable {
    var image: UIImage? { get set }
    func loadImage(from url: URL)
    func swapImage(to image: UIImage)
}

public extension ImageLoadable {
    func loadImage(from url: URL) {
        ImageCache.shared.load(from: url, to: self)
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
