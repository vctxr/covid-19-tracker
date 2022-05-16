//
//  ChainedAsyncResultOperationError.swift
//  
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Foundation

public enum ChainedAsyncResultOperationError: Error {
    case noInput
    case canceled
}

extension ChainedAsyncResultOperationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInput:
            return "The operation has no input."
        case .canceled:
            return "The operation has been canceled."
        }
    }
}
