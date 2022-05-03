//
//  ChainedAsyncResultOutputProviding.swift
//  
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Foundation

protocol ChainedAsyncResultOutputProviding {
    var outputResult: Any? { get }
}

open class ChainedAsyncResultOperation<Input, Output, Failure>: AsyncResultOperation<Output, Failure> where Failure: Error {
    private(set) public var input: Input?
    
    private var inputFromDependencies: Input? {
        dependencies.compactMap { $0 as? ChainedAsyncResultOutputProviding }.first?.outputResult as? Input
    }
    
    public init(input: Input? = nil) {
        self.input = input
        super.init()
    }
    
    public override func start() {
        input = input ?? inputFromDependencies
        super.start()
    }
}

// MARK: - ChainedAsyncResultOutputProviding

extension ChainedAsyncResultOperation: ChainedAsyncResultOutputProviding {
    var outputResult: Any? { result }
}
