//
//  SharedDateFormatter.swift
//  
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation

public protocol DateFormatterType {
    func string(from date: Date) -> String
    func date(from string: String) -> Date?
}

extension DateFormatter: DateFormatterType {}

public final class SharedDateFormatter {
    // MARK: - Variables 📦
    
    public static let shared = SharedDateFormatter()
    
    private var cachedDateFormatters: [String: DateFormatterType] = [:]
    private let queue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).date-formatter.queue")
    
    // MARK: - Methods ⛓
    
    public func formatter(withFormat format: String) -> DateFormatterType {
        queue.sync {
            if let cachedFormatter = cachedDateFormatters[format] {
                return cachedFormatter
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            
            cachedDateFormatters[format] = dateFormatter
            
            return dateFormatter
        }
    }
}
