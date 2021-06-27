//
//  Date+Formatter.swift
//  
//
//  Created by Murilo Teixeira on 23/06/21.
//

import Foundation

public extension Date {
    enum DateFormat: String {
        case MMM
        case MMMM
    }
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        return formatter
    }()
    
    static let calendar = Calendar.current
    
    var hour: Int {
        Self.calendar.component(.hour, from: self)
    }
    
    var minute: Int {
        Self.calendar.component(.minute, from: self)
    }
    
    var day: Int {
        Self.calendar.component(.day, from: self)
    }
    
    var month: Int {
        Self.calendar.component(.month, from: self)
    }
    
    var year: Int {
        Self.calendar.component(.year, from: self)
    }
    
    var hourString: String {
        Self.formatter.timeStyle = .short
        Self.formatter.dateStyle = .none
        return Self.formatter.string(from: self)
    }
    
    var dateString: String {
        Self.formatter.dateStyle = .short
        Self.formatter.timeStyle = .none
        return Self.formatter.string(from: self)
    }
    
    var dateTimeString: String {
        Self.formatter.dateStyle = .short
        Self.formatter.timeStyle = .short
        return Self.formatter.string(from: self)
    }
    
    func date(with format: DateFormat) -> String {
        Self.formatter.dateFormat = format.rawValue
        return Self.formatter.string(from: self)
    }
}
