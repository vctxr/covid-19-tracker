//
//  OperationError.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Networking
import AsyncOperation

enum OperationError: Error {
    case networkError(_ error: NetworkError)
    case operationError(_ error: ChainedAsyncResultOperationError)
    case underlyingError(_ error: Error)
}
