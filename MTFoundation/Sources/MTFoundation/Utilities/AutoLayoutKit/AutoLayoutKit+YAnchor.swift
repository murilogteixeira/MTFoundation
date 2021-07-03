//
//  ConstraintMaker+YAnchor.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension AutoLayoutKit {
    
    enum YAnchor: AutoLayoutKitAnchor {
        
        public typealias AnchorType = NSLayoutYAxisAnchor
        
        case top, bottom, safeTop, safeBottom, center
        
        public var isReverseConstant: Bool {
            switch self {
            case .safeBottom, .bottom: return true
            case .top, .safeTop, .center: return false
            }
        }
        
        public func layoutAnchor(to view: UIView) -> NSLayoutAnchor<AnchorType> {
            switch self {
            case .top: return view.topAnchor
            case .bottom: return view.bottomAnchor
            case .safeTop: return view.safeAreaLayoutGuide.topAnchor
            case .safeBottom: return view.safeAreaLayoutGuide.bottomAnchor
            case .center: return view.centerYAnchor
            }
        }
        
    }
    
}
