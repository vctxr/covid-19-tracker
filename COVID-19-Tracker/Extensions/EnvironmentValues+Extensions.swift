//
//  aaa.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 28/04/22.
//

import SwiftUI

// MARK: - IsRefreshableKey

private struct IsRefreshableKey: EnvironmentKey {
    static var defaultValue: Bool { false }
}

extension EnvironmentValues {
    var isRefreshable: Bool {
        get { self[IsRefreshableKey.self] }
        set { self[IsRefreshableKey.self] = newValue }
    }
}
