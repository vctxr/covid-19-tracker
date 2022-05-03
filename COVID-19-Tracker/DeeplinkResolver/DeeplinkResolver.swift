//
//  DeeplinkResolver.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

struct DeeplinkResolver {
    // MARK: - Variables 📦
    
    /// The scheme of the app defined in project's `Info` tab.
    private static let scheme = "covid-19-tracker"
    
    // MARK: - Methods ⛓
    
    /// Resolve a given `URL` to a `DeeplinkResolver.Target`
    /// - Parameter url: The `URL` to be resolved.
    /// - Returns: a `DeeplinkResolver.Target` representing the deeplink target to navigate to.
    static func resolve(url: URL) -> DeeplinkResolver.Target {
        guard url.scheme == scheme else { return .root }
        return Target(url: url)
    }
}
