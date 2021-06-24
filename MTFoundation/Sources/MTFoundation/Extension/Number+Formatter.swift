//
//  Number+Formatter.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import Foundation

public extension Int {
    func toString(plates platesCount: Int) -> String {
        String(format: "%.\(platesCount)d", self)
    }
}

public extension Double {
    func toString(plates platesCount: Int) -> String {
        String(format: "%.\(platesCount)f", self)
    }
}

public extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}

public extension Formatter {
    static let currency = NumberFormatter(style: .currency) }

public extension FloatingPoint {
    var currency: String { Formatter.currency.string(for: self) ?? "" }
}
