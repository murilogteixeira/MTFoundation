//
//  String+Extensions.swift
//  
//
//  Created by Murilo Teixeira on 21/06/21.
//

import Foundation

public extension String {
    static let numberFormatter = NumberFormatter()
    
    var doubleValue: Double {
        String.numberFormatter.locale = Locale.current
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
    
}
