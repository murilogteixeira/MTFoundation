//
//  Storable.swift
//  
//
//  Created by Murilo Teixeira on 31/10/21.
//

import Foundation

public protocol Storable {
    var rawValue: String { get }
    func value<T>() -> T?
    func set<T>(_ value: T)
}

public extension Storable {
    private var userDefaults: UserDefaults { UserDefaults.standard }

    func value<T>() -> T? { userDefaults.object(forKey: rawValue) as? T }
    func set<T>(_ value: T) { userDefaults.set(value, forKey: rawValue) }
}
