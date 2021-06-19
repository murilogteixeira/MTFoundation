//
//  File.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

import Foundation

protocol Identifiable {
    static var uniqueIdentifier: String { get }
}

extension Identifiable {
    static var uniqueIdentifier: String { String(describing: self) }
}
