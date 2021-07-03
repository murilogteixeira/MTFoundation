//
//  ConstraintMaker+SizeAnchor.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    enum SizeAnchor: AutoLayoutKitAnchor {
        public typealias AnchorType = NSLayoutDimension
        
        case width, height
        
        public var isReverseConstant: Bool { false }
        
        public func layoutAnchor(to view: UIView) -> NSLayoutAnchor<NSLayoutDimension> {
            layoutDimension(to: view)
        }
        
        public func layoutDimension(to view: UIView) -> AnchorType {
            switch self {
            case .width: return view.widthAnchor
            case .height: return view.heightAnchor
            }
        }
        
    }
    
}
