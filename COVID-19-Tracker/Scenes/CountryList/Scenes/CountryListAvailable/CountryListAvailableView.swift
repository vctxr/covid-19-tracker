//
//  CountryListAvailableView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 26/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListAvailableView: View {
    // MARK: - Variables 📦
    
    @Environment(\.isRefreshable) private var isRefreshable
    
    let store: Store<CountryListAvailableState, CountryListAvailableAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.covidCountryStates,
                        action: CountryListAvailableAction.covidCountryCard
                    )
                ) { covidCountryCardStore in
                    CovidCountryCardView(store: covidCountryCardStore)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(
                    EdgeInsets(
                        top: 3,
                        leading: 16,
                        bottom: 3,
                        trailing: 16
                    )
                )
                .padding(.top, 8)
            }
            .listStyle(.plain)
            .if(isRefreshable) { view in
                /*
                 Because this view is also used as the loading state,
                 we only want it to be refreshable if it is already loaded.
                 */
                view.refreshable {
                    await viewStore.send(.onRefresh, while: \.isRefreshing)
                }
            }
            .animation(.default, value: viewStore.covidCountryStates)
            .ignoresSafeArea(.keyboard)
            .onAppear {
                UITableView.appearance().keyboardDismissMode = .onDrag
            }
        }
    }
}

struct CountryListAvailableView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListAvailableView(
                store: Store(
                    initialState: .template,
                    reducer: .empty,
                    environment: ()
                )
            )
            .redacted(reason: .placeholder)
            
            CountryListAvailableView(
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
