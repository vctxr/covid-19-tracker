//
//  DeeplinkResolver.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

struct DeeplinkResolver {
    // MARK: - Variables 📦
    
    private static let scheme = "covid-19-tracker"
    
    // MARK: - Methods ⛓
    
    static func resolve(url: URL) -> DeeplinkResolver.Target {
        guard url.scheme == scheme else { return .root }
        return Target(url: url)
    }
}
