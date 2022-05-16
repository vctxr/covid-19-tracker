//
//  OperationError.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Foundation
import Networking
import AsyncOperation

enum OperationError: Error {
    case networkError(_ error: NetworkError)
    case operationError(_ error: ChainedAsyncResultOperationError)
    case underlyingError(_ error: Error)
}

extension OperationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkError(let networkError):
            return networkError.localizedDescription
        case .operationError(let operationError):
            return operationError.localizedDescription
        case .underlyingError(let error):
            return error.localizedDescription
        }
    }
}
