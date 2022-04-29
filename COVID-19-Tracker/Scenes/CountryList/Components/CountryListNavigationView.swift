//
//  CountryListNavigationView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 28/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListNavigationView<ContentView: View>: View {
    // MARK: - UI Components 🎨
    
    private let viewStore: ViewStore<CountryListState, CountryListAction>
    private let contentView: ContentView
    
    init(
        viewStore: ViewStore<CountryListState, CountryListAction>,
        @ViewBuilder contentView: () -> ContentView
    ) {
        self.viewStore = viewStore
        self.contentView = contentView()
    }
    
    // MARK: - Body 🎨
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Countries 🦠")
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
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search for countries"
        )
    }
}

// MARK: - Previews 📷

struct CountryListNavigationView_Previews: PreviewProvider {
    
    static var groupPreviews: some View {
        Group {
            CountryListNavigationView(
                viewStore: ViewStore(
                    Store(
                        initialState: .templateAvailable,
                        reducer: .empty,
                        environment: ()
                    )
                )
            ) {
                Color.systemBackground
            }
        }
    }

    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
