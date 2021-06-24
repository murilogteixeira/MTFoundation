//
//  File.swift
//  
//
//  Created by Murilo Teixeira on 21/06/21.
//

import Foundation

public extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var isNotEmpty: Bool { !self.isEmpty }
}
