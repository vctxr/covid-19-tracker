//
//  aaa.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 28/04/22.
//

import SwiftUI

private struct IsRefreshableKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var isRefreshable: Bool {
        get { self[IsRefreshableKey.self] }
        set { self[IsRefreshableKey.self] = newValue }
    }
}
