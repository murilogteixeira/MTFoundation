//
//  ConstraintMaker+Edge.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension ConstraintMaker {
    
    class Edge {
        
        public init(view: UIView, edgeAnchor: EdgeAnchor) {
            self.view = view
            self.edgeAnchor = edgeAnchor
        }
    
        private unowned let view: UIView
        private let edgeAnchor: EdgeAnchor
        
        private func vertical(_ view: UIView, constant: CGFloat, isActive: Bool) -> [NSLayoutConstraint] {
            [
                self.view.pin.top.to(view, constant: constant, isActive: isActive),
                self.view.pin.bottom.to(view, constant: constant, isActive: isActive)
            ]
        }
        
        private func horizontal(_ view: UIView, constant: CGFloat, isActive: Bool) -> [NSLayoutConstraint] {
            [
                self.view.pin.leading.to(view, constant: constant, isActive: isActive),
                self.view.pin.trailing.to(view, constant: constant, isActive: isActive)
            ]
        }
        
        @discardableResult
        public func to(_ view: UIView, constant: CGFloat = 0, isActive: Bool = true) -> [NSLayoutConstraint] {
            let verticalConstraints = vertical(view, constant: constant, isActive: isActive)
            let horizontalConstraints = horizontal(view, constant: constant, isActive: isActive)
            
            switch edgeAnchor {
            case .vertical: return verticalConstraints
            case .horizontal: return horizontalConstraints
            case .all: return verticalConstraints + horizontalConstraints
            }
        }
        
    }
    
}
