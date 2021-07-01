//
//  ConstraintMaker+XAnchor.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension ConstraintMaker {
    
    enum XAnchor: ConstraintMakerAnchor {
        
        public typealias AnchorType = NSLayoutXAxisAnchor
        
        case leading, trailing, safeLeading, safeTrailing, center
        
        public var isReverseConstant: Bool {
            switch self {
            case .safeTrailing, .trailing: return true
            case .leading, .safeLeading, .center: return false
            }
        }
        
        public func layoutAnchor(to view: UIView) -> NSLayoutAnchor<AnchorType> {
            switch self {
            case .leading: return view.leadingAnchor
            case .trailing: return view.trailingAnchor
            case .safeLeading: return view.safeAreaLayoutGuide.leadingAnchor
            case .safeTrailing: return view.safeAreaLayoutGuide.trailingAnchor
            case .center: return view.centerXAnchor
            }
        }
        
    }
    
}
