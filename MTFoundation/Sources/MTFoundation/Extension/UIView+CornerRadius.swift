//
//  UIView+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 22/06/21.
//

import UIKit

public extension UIView {
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    func cornerRadius(_ cornerRadius: CGFloat, in location: CACornerMask = .all) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = location
    }
    
}

public extension CACornerMask {
    static var leftTop: CACornerMask { .layerMinXMinYCorner }
    static var leftBottom: CACornerMask { .layerMinXMaxYCorner }
    static var rightTop: CACornerMask { .layerMaxXMinYCorner }
    static var rightBottom: CACornerMask { .layerMaxXMaxYCorner }
    static var top: CACornerMask { [leftTop, rightTop] }
    static var left: CACornerMask { [leftTop, leftBottom] }
    static var bottom: CACornerMask { [leftBottom, rightBottom] }
    static var right: CACornerMask { [rightTop, rightBottom] }
    static var all: CACornerMask { [leftTop, rightTop, .leftBottom, .rightBottom] }
}
