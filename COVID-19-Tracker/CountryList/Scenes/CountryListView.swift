//
//  CountryListView.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryListState, CountryListAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                SwitchStore(store.scope(state: \.uiState)) {
                    CaseLet(state: /CountryListState.UIState.loading,
                            action: CountryListAction.loading) { _ in
                        CountryListContentView(store: .redacted)
                            .redacted(reason: .placeholder)
                    }

                    CaseLet(state: /CountryListState.UIState.loaded,
                            action: CountryListAction.loaded) { loadedStore in
                        CountryListContentView(store: loadedStore)
                    }
                }
                .navigationTitle(viewStore.titleText)
                .toolbar {
                    Menu {
                        Picker(
                            selection: viewStore.binding(
                                get: \.sortType,
                                send: CountryListAction.onSortTypeChanged
                            )
                        ) {
                            Text("Most Cases 🤧")
                                .tag(SortType.cases(.descending))
                            Text("Least Cases 😷")
                                .tag(SortType.cases(.ascending))
                            Text("Highest Fatality 💀")
                                .tag(SortType.fatality(.descending))
                            Text("Lowest Fatality 💉")
                                .tag(SortType.fatality(.ascending))
                        } label: {}
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    }
                }
            }
            .searchable(
                text: viewStore.binding(
                    get: \.searchText,
                    send: CountryListAction.onSearchTextChanged
                ),
                prompt: "Search for countries"
            )
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Previews 📷

struct ContentView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListView(
                store: Store(
                    initialState: .templateRedacted,
                    reducer: countryListReducer,
                    environment: .live
                )
            )
            
            CountryListView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: countryListReducer,
                    environment: .live
                )
            )
            
            CountryListView(
                store: Store(
                    initialState: .templateEmpty,
                    reducer: countryListReducer,
                    environment: .live
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
