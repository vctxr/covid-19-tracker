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
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.countryCovidStates,
                        action: CountryListContentAction.countryCovid
                    )
                ) { store in
                    CountryCovidView(store: store)
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            EdgeInsets(
                                top: 3,
                                leading: 16,
                                bottom: 3,
                                trailing: 16
                            )
                        )
                }
                .padding(.top, 8)
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
            CountryListContentView(
                store: Store(
                    initialState: .template,
                    reducer: .empty,
                    environment: ()
                )
            )
            .redacted(reason: .placeholder)

            CountryListContentView(
                store: Store(
                    initialState: .template,
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
