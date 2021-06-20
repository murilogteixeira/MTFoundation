//
//  Identifiable.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

public protocol Identifiable {
    static var uniqueIdentifier: String { get }
}

public extension Identifiable {
    static var uniqueIdentifier: String { String(describing: self) }
}
