//
//  Identifiable.swift
//  
//
//  Created by Murilo Teixeira on 19/06/21.
//

import  UIKit

public protocol Identifiable {
    static var uniqueIdentifier: String { get }
}

public extension Identifiable {
    static var uniqueIdentifier: String { String(describing: self) }
}

extension UIView: Identifiable {}
extension UIViewController: Identifiable {}
