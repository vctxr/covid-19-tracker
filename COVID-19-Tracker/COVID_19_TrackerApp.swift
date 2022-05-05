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
    
    /// The instance of the `Deeplink` object which manages the app's deeplink.
    @StateObject private var deeplink = Deeplink()
    
    /// The current phase of the scene.
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: - Inits 🐣
    
    init() {
        BGTaskService.shared.registerTasks()
        
        // TODO: Remove this!
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { _, _ in })
    }
    
    /// The root store of the app.
    private let store = Store(
        initialState: CountryListState(),
        reducer: countryListMasterReducer,
        environment: .live
    )

    // MARK: - Body 🎨

    var body: some Scene {
        WindowGroup {
            /// We store the `Store` in a property to prevent the state from resetting whenever this body re-draws.
            CountryListView(store: store)
                // So all child views have access to this deeplink.
                .environmentObject(deeplink)
                // To handle deeplink.
                .onOpenURL { url in
                    debugPrint("🌏 Receive URL: \(url)")
                    let target = DeeplinkResolver.resolve(url: url)
                    debugPrint("🔓 Resolved: \(target)")
                    deeplink.target = target
                }
                .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .background:
                        BGTaskService.shared.scheduleTasksIfNeeded()
                    case .inactive:
                        break
                    case .active:
                        break
                    @unknown default:
                        break
                    }
                }
        }
    }
}
