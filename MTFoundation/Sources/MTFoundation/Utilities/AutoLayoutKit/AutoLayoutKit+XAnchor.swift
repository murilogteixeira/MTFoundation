//
//  ConstraintMaker+XAnchor.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    enum XAnchor: AutoLayoutKitAnchor {
        
        public typealias AnchorType = NSLayoutXAxisAnchor
        
        case leading, trailing, leadingSafe, trailingSafe, center
        
        public var isReverseConstant: Bool {
            switch self {
            case .trailingSafe, .trailing: return true
            case .leading, .leadingSafe, .center: return false
            }
        }
        
        public func layoutAnchor(to view: UIView) -> NSLayoutAnchor<AnchorType> {
            switch self {
            case .leading: return view.leadingAnchor
            case .trailing: return view.trailingAnchor
            case .leadingSafe: return view.safeAreaLayoutGuide.leadingAnchor
            case .trailingSafe: return view.safeAreaLayoutGuide.trailingAnchor
            case .center: return view.centerXAnchor
            }
        }
        
    }
    
}
