//
//  NetworkingService.swift
//  
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import Combine

public class NetworkingService {
    // MARK: - Variables 📦
    
    public var logLevel: NetworkingLogLevel {
        get { logger.logLevel }
        set { logger.logLevel = newValue }
    }
    
    private let logger = NetworkingLogger()
    
    // MARK: - Inits 🐣
    
    public init(logLevel: NetworkingLogLevel = .off) {
        self.logLevel = logLevel
    }
    
    // MARK: - Methods ⛓
    
    public func request<T: Decodable>(with urlRequest: URLRequest) -> AnyPublisher<T, NetworkError> {
        logger.log(request: urlRequest)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { [logger] data, response -> T in
                logger.log(response: response, data: data)
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    throw NetworkError.noResponse
                }
                
                guard 0..<300 ~= statusCode else {
                    throw NetworkError(errorCode: statusCode)
                }
                
                return try JSONDecoder().decode(T.self, from: data)
            }
            .mapError { [logger] error in
                logger.log(error: error)
                return NetworkError(error: error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
