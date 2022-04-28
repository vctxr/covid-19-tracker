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
