//
//  CountryListLoadedView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListLoadedView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryListLoadedState, CountryListLoadedAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.countryCovidStates,
                        action: CountryListLoadedAction.countryCovid
                    )
                ) { store in
                    CountryCovidView(store: store)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .animation(.default, value: viewStore.countryCovidStates)
            .ignoresSafeArea(.keyboard)
            .onAppear {
                UITableView.appearance().keyboardDismissMode = .onDrag
            }
        }
    }
}

// MARK: - Previews 📷

struct CountryListLoadedView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListLoadedView(
                store: Store(
                    initialState: .template,
                    reducer: .noop,
                    environment: ()
                )
            )
            .redacted(reason: .placeholder)

            CountryListLoadedView(
                store: Store(
                    initialState: .template,
                    reducer: .noop,
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
