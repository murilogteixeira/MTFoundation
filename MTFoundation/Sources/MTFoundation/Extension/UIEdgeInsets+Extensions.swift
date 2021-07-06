//
//  UIEdgeInsets+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import UIKit

public extension UIEdgeInsets {
    
    init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        self.init(
            top: top ?? 0,
            left: left ?? 0,
            bottom: bottom ?? 0,
            right: right ?? 0
        )
    }
    
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            left: horizontal,
            bottom: vertical,
            right: horizontal
        )
    }
    
    init(top: CGFloat? = nil, bottom: CGFloat? = nil, horizontal: CGFloat) {
        self.init(
            top: top ?? 0,
            left: horizontal,
            bottom: bottom ?? 0,
            right: horizontal
        )
    }
    
    init(left: CGFloat? = nil, right: CGFloat? = nil, vertical: CGFloat) {
        self.init(
            top: vertical,
            left: left ?? 0,
            bottom: vertical,
            right: right ?? 0
        )
    }
    
}
