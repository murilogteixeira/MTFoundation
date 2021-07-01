//
//  UIView+ConstraintMaker.swift
//  
//
//  Created by Murilo Teixeira on 01/07/21.
//

import UIKit

public extension UIView {
    
    var pin: ConstraintMaker {
        ConstraintMaker(view: self)
    }
    
}
