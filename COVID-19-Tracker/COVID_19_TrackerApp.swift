//
//  COVID_19_TrackerApp.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct COVID_19_TrackerApp: App {
    
    // MARK: - Variables 📦
    
    @StateObject private var deeplink = Deeplink()
    
    private let store = Store(
        initialState: CountryListState(),
        reducer: countryListMasterReducer,
        environment: .live
    )

    // MARK: - Body 🎨

    var body: some Scene {
        WindowGroup {
            CountryListView(store: store)
                .environmentObject(deeplink)
                .onOpenURL { url in
                    debugPrint("🌏 Receive URL: \(url)")
                    let target = DeeplinkResolver.resolve(url: url)
                    debugPrint("🔓 Resolved: \(target)")
                    deeplink.target = target
                }
        }
    }
}
