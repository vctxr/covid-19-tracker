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
    
    init() {
        // Restoring pre-iOS 15 appearance.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            CountryListView(
                store: Store(
                    initialState: CountryListState(),
                    reducer: countryListMasterReducer,
                    environment: .live
                )
            )
        }
    }
}
