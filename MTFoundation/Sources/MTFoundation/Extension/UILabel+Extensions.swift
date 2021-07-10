//
//  UILabel+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import UIKit

public extension UILabel {
    
    convenience init(
        _ text: String? = nil,
        color: UIColor = .label,
        font: UIFont? = nil,
        size: CGFloat = 17,
        textAlignment: NSTextAlignment? = nil,
        numberOfLines: Int? = nil
    ) {
        self.init(frame: .zero)
        self.text = text
        self.font = font ?? .systemFont(ofSize: size)
        self.font = self.font.withSize(size)
        self.textAlignment = textAlignment ?? .left
        self.numberOfLines = numberOfLines ?? 1
    }
    
}
