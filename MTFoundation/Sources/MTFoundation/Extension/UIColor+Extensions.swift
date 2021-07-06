//
//  UIColor+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import UIKit

public extension UIColor {
    
    /**
     Create an object of UIColor from RGBA value
     - Parameters:
         - red: red color
         - green:  green color
         - blue:  blue color
         - alpha:  alpha
     - Returns: An UIColor object
     
     - Example:
     ````
     UIColor.rgba(255, 255, 255, 1)
     ````
     */
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
}
