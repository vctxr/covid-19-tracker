//
//  AsyncOperation.swift
//
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import Foundation

open class AsyncOperation: Operation {
    public enum State: String {
        case ready, executing, finished
        
        fileprivate var key: String {
            "is" + rawValue.capitalized
        }
    }
    
    public var state = State.ready {   // KVO to manually notify the operation for state changes.
        willSet {
            willChangeValue(forKey: newValue.key)
            willChangeValue(forKey: state.key)
        }
        didSet {
            didChangeValue(forKey: oldValue.key)
            didChangeValue(forKey: state.key)
        }
    }
}

// MARK: - Overrides

extension AsyncOperation {
    /// The `isReady` attribute needs to incorporate the value from the superclass according to Apple documentation.
    public override var isReady: Bool        { super.isReady && state == .ready }
    public override var isExecuting: Bool    { state == .executing }
    public override var isFinished: Bool     { state == .finished }
    public override var isAsynchronous: Bool { true }
    
    public override func start() {
        if isCancelled { return state = .finished }
        main()
        state = .executing
    }
    
    open override func cancel() {
        state = .finished
    }
}
