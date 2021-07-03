//
//  ConstraintMaker+Size.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    class Size: Pin<SizeAnchor> {
        
        public override init(view: UIView, origin: SizeAnchor) {
            self.view = view
            self.origin = origin
            super.init(view: view, origin: origin)
        }
        
        private unowned let view: UIView
        private let origin: SizeAnchor
        
        private func constraint(with relation: Relation) -> NSLayoutConstraint {
            let anchor = origin.layoutDimension(to: view)
            switch relation {
            case .equal: return anchor.constraint(equalToConstant: 0)
            case .less: return view.heightAnchor.constraint(equalToConstant: 0)
            case .greater: return view.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            }
        }
        
        private func constraint(in inAnchor: NSLayoutDimension, with relation: Relation, and multiplier: CGFloat) -> NSLayoutConstraint {
            let anchor = origin.layoutDimension(to: view)
            switch relation {
            case .equal: return anchor.constraint(equalTo: inAnchor, multiplier: multiplier)
            case .less: return view.heightAnchor.constraint(lessThanOrEqualTo: inAnchor, multiplier: multiplier)
            case .greater: return view.heightAnchor.constraint(greaterThanOrEqualTo: inAnchor, multiplier: multiplier)
            }
        }
        
        @discardableResult
        public func constant(_ constant: CGFloat, relation: Relation = .equal, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
            let constraint = constraint(with: relation)
            
            constraint.constant = constant
            constraint.priority = priority
            constraint.isActive = isActive
            
            return constraint
        }
        
        @discardableResult
        public func to(
            _ view: UIView,
            location: SizeAnchor? = nil,
            relation: Relation = .equal,
            multiplier: CGFloat = 1,
            constant: CGFloat = 0,
            priority: UILayoutPriority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            
            let safeLocation = location ?? origin
            let dimensionAnchor = safeLocation.layoutDimension(to: view)
            
            let constraint = self.constraint(in: dimensionAnchor, with: relation, and: multiplier)
            
            constraint.constant = constant
            constraint.priority = priority
            constraint.isActive = isActive
            
            return constraint
        }
        
    }
    
}
