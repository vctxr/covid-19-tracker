//
//  File.swift
//  
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation

// MARK: - Network Error

public struct NetworkError: Error, Equatable {
    let error: Error
    
    public init(error: Error) {
        self.error = error
    }
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        String(reflecting: lhs.error) == String(reflecting: rhs.error)
    }
}

// MARK: - Network Error Localized Error

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        error.localizedDescription
    }
}

// MARK: - Parsing Error

public enum ParsingError: Error, Equatable {
    case keyNotFound
    case typeMismatch
}

// MARK: - Parsing Error Localized Error

extension ParsingError: LocalizedError {
    public var errorDescription: String? {
        "Something went wrong, please try again later."
    }
}
