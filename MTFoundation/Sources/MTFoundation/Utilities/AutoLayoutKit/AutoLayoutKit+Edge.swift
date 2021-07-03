//
//  ConstraintMaker+Edge.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    class Edge {
        
        public init(view: UIView, edgeAnchor: EdgeAnchor) {
            self.view = view
            self.edgeAnchor = edgeAnchor
        }
        
        private unowned let view: UIView
        private let edgeAnchor: EdgeAnchor
        
        private func vertical(_ view: UIView, location: EdgeAnchor = .vertical, constant: CGFloat, isActive: Bool) -> [NSLayoutConstraint] {
            switch location {
            case .vertical:
                return [
                    self.view.pinTop.to(view, constant: constant, isActive: isActive),
                    self.view.pinBottom.to(view, constant: constant, isActive: isActive)
                ]
            case .verticalSafe:
                return [
                    self.view.pinTop.to(view, location: .safeTop, constant: constant, isActive: isActive),
                    self.view.pinBottom.to(view, location: .safeBottom, constant: constant, isActive: isActive)
                ]
            default: fatalError("Only vertical and verticalSafe is allowed here")
            }
        }
        
        private func horizontal(_ view: UIView, location: EdgeAnchor = .horizontal, constant: CGFloat, isActive: Bool) -> [NSLayoutConstraint] {
            switch location {
            case .horizontal:
                return [
                    self.view.pinLeading.to(view, constant: constant, isActive: isActive),
                    self.view.pinTrailing.to(view, constant: constant, isActive: isActive)
                ]
            case .horizontalSafe:
                return [
                    self.view.pinLeading.to(view, location: .leadingSafe, constant: constant, isActive: isActive),
                    self.view.pinTrailing.to(view, location: .trailingSafe, constant: constant, isActive: isActive)
                ]
            default: fatalError("Only horizontal and horizontalSafe is allowed here")
            }
        }
        
        @discardableResult
        public func to(_ view: UIView, location: EdgeAnchor? = nil, constant: CGFloat = 0, isActive: Bool = true) -> [NSLayoutConstraint] {
            let location = location ?? edgeAnchor
            
            switch location {
            case .vertical: return vertical(view, constant: constant, isActive: isActive)
            case .horizontal: return horizontal(view, constant: constant, isActive: isActive)
            case .all:
                let vertical = vertical(view, constant: constant, isActive: isActive)
                let horizontal = horizontal(view, constant: constant, isActive: isActive)
                return vertical + horizontal
            case .verticalSafe: return vertical(view, location: .verticalSafe, constant: constant, isActive: isActive)
            case .horizontalSafe: return horizontal(view, location: .horizontalSafe,constant: constant, isActive: isActive)
            case .allSafe:
                let vertical = vertical(view, location: .verticalSafe, constant: constant, isActive: isActive)
                let horizontal = horizontal(view, location: .horizontalSafe,constant: constant, isActive: isActive)
                return vertical + horizontal
            }
        }
        
    }
    
}
