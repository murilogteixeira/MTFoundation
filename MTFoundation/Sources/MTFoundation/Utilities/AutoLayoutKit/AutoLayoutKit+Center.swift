//
//  ConstraintMaker+Center.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    class Center {
        
        public init(view: UIView) {
            self.view = view
        }
        
        private unowned let view: UIView
        
        @discardableResult
        public func to(_ view: UIView, isActive: Bool = true) -> [NSLayoutConstraint] {
            [
                self.view.pinCenterX.to(view, isActive: isActive),
                self.view.pinCenterY.to(view, isActive: isActive)
            ]
        }
    }
}
