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

    func toBase64() -> String {
        self.data(using: .utf8)?.base64EncodedString() ?? ""
    }

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
