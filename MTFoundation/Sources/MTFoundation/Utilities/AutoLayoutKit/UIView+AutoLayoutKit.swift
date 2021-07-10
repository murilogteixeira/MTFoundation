//
//  UIView+ConstraintMaker.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension UIView {
    
    private var pin: AutoLayoutKit { AutoLayoutKit(view: self) }
    
    var pinLeading: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.leading }
    var pinTrailing: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.trailing }
    var pinCenterX: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.centerX }
    
    var pinTop: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.top }
    var pinBottom: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.bottom }
    var pinCenterY: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.centerY }
    
    var pinWidth: AutoLayoutKit.Size { pin.width }
    var pinHeight: AutoLayoutKit.Size { pin.height }
    
    var pinCenter: AutoLayoutKit.Center { pin.center }
    
    var pinEdgeX: AutoLayoutKit.Edge { pin.edgeX }
    var pinEdgeY: AutoLayoutKit.Edge { pin.edgeY }
    var pinEdge: AutoLayoutKit.Edge { pin.edge }
    
}
