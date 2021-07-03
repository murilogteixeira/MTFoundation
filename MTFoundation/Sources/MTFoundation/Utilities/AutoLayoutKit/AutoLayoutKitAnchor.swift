//
//  ConstraintMakerAnchor.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public protocol AutoLayoutKitAnchor {
    associatedtype AnchorType: AnyObject
    
    var isReverseConstant: Bool { get }
    
    func layoutAnchor(to view: UIView) -> NSLayoutAnchor<AnchorType>
}
