//
//  GradientView.swift
//  
//
//  Created by Murilo Teixeira on 10/07/21.
//

import UIKit

public class GradientView: UIView {
    
    enum Point {
        case top, left, bottom, right, topLeft, topRight, bottomLeft, bottomRight
        
        var value: CGPoint {
            switch self {
            case .top: return CGPoint(x: 0.5, y: 0)
            case .left: return CGPoint(x: 0.5, y: 0.5)
            case .bottom: return CGPoint(x: 0.5, y: 1)
            case .right: return CGPoint(x: 1, y: 0.5)
            case .topLeft: return CGPoint(x: 0, y: 0)
            case .topRight: return CGPoint(x: 1, y: 0)
            case .bottomLeft: return CGPoint(x: 0, y: 1)
            case .bottomRight: return CGPoint(x: 1, y: 1)
            }
        }
    }
    
    public override class var layerClass: AnyClass { CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { self.layer as? CAGradientLayer ?? CAGradientLayer() }
    
    public func setup(colors: [UIColor], locations: [NSNumber]? = nil, startPoint: Point? = nil, endPoint: Point? = nil) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations ?? [0, 1]
        gradientLayer.startPoint = startPoint?.value ?? Point.top.value
        gradientLayer.endPoint = endPoint?.value ?? Point.bottom.value
    }
}
