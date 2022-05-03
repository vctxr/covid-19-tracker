//
//  AsyncResultOperation.swift
//  
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Foundation

open class AsyncResultOperation<Success, Failure>: AsyncOperation where Failure: Error {
    private(set) var result: Result<Success, Failure>? {
        didSet {
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.onResult?(result)
            }
        }
    }
    
    public var onResult: ((_ result: Result<Success, Failure>) -> Void)?
    public var onStart: (() -> Void)?
    
    open override func start() {
        DispatchQueue.main.async {
            self.onStart?()
        }
        super.start()
    }
    
    public func finish(with result: Result<Success, Failure>) {
        self.result = result
        state = .finished
    }
    
    public func cancel(with error: Failure) {
        result = .failure(error)
        super.cancel()
    }
    
    open override func cancel() {
        fatalError("You should use cancel(with: ) to ensure a result")
    }
}
