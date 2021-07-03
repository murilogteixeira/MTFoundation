//
//  UIView+ConstraintMaker.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension UIView {
    
    private var pin: AutoLayoutKit { AutoLayoutKit(view: self) }
    
    public var pinLeading: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.leading }
    public var pinTrailing: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.trailing }
    public var pinCenterX: AutoLayoutKit.Pin<AutoLayoutKit.XAnchor> { pin.centerX }
    
    public var pinTop: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.top }
    public var pinBottom: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.bottom }
    public var pinCenterY: AutoLayoutKit.Pin<AutoLayoutKit.YAnchor> { pin.centerY }
    
    public var pinWidth: AutoLayoutKit.Size { pin.width }
    public var pinHeight: AutoLayoutKit.Size { pin.height }
    
    public var pinCenter: AutoLayoutKit.Center { pin.center }
    
    public var pinEdgeX: AutoLayoutKit.Edge { pin.edgeX }
    public var pinEdgeY: AutoLayoutKit.Edge { pin.edgeY }
    public var pinEdge: AutoLayoutKit.Edge { pin.edge }
    
}
