//
//  CountryListContentView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListContentView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryListContentState, CountryListContentAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        SwitchStore(store.scope(state: \.contentState)) {
            CaseLet(state: /CountryListContentState.ContentState.empty,
                    action: CountryListContentAction.empty) { _ in
                CountryListEmptyView()
            }

            CaseLet(state: /CountryListContentState.ContentState.available,
                    action: CountryListContentAction.available) { availableStore in
                CountryListAvailableView(store: availableStore)
            }
        }
    }
}

// MARK: - Previews 📷

struct CountryListLoadedView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListContentView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: .empty,
                    environment: ()
                )
            )
            .redacted(reason: .placeholder)

            CountryListContentView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: .empty,
                    environment: ()
                )
            )
            
            CountryListContentView(
                store: Store(
                    initialState: .templateEmpty,
                    reducer: .empty,
                    environment: ()
                )
            )
        }
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
