//
//  ConstraintMaker+Pin.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    class Pin<Anchor: AutoLayoutKitAnchor> {
        
        public init(view: UIView, origin: Anchor) {
            self.view = view
            self.origin = origin
        }
        
        private unowned let view: UIView
        private let origin: Anchor
        
        private func constraint(in inAnchor: NSLayoutAnchor<Anchor.AnchorType>, with relation: Relation) -> NSLayoutConstraint {
            let anchor = origin.layoutAnchor(to: view)
            switch relation {
            case .equal: return anchor.constraint(equalTo: inAnchor)
            case .greater: return anchor.constraint(greaterThanOrEqualTo: inAnchor)
            case .less: return anchor.constraint(lessThanOrEqualTo: inAnchor)
            }
        }
        
        @discardableResult
        public func to(
            _ view: UIView,
            location: Anchor? = nil,
            relation: Relation = .equal,
            constant: CGFloat = 0,
            priority: UILayoutPriority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            let safeLocation = location ?? origin
            let layoutAnchor = safeLocation.layoutAnchor(to: view)
            
            let constraint = self.constraint(in: layoutAnchor, with: relation)
            
            constraint.constant = constant
            
            if origin.isReverseConstant { constraint.constant *= -1 }
            
            constraint.priority = priority
            constraint.isActive = isActive
            
            return constraint
        }
        
    }
    
}
