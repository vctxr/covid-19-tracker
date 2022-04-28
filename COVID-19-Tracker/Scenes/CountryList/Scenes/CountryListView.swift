//
//  CountryListView.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture
import AlertToast

struct CountryListView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryListState, CountryListAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            CountryListNavigationView(viewStore: viewStore) {
                SwitchStore(store.scope(state: \.uiState)) {
                    CaseLet(state: /CountryListState.UIState.loading,
                            action: CountryListAction.loading) { _ in
                        CountryListContentView(store: .empty)
                            .redacted(reason: .placeholder)
                    }
                    
                    CaseLet(state: /CountryListState.UIState.loaded,
                            action: CountryListAction.loaded) { loadedStore in
                        CountryListContentView(store: loadedStore)
                            .environment(\.isRefreshable, true)
                    }
                    
                    CaseLet(state: /CountryListState.UIState.error,
                            action: CountryListAction.error) { errorStore in
                        CountryListErrorView(store: errorStore)
                    }
                }
                .toast(
                    isPresenting: viewStore.binding(
                        get: \.isShowingToast,
                        send: CountryListAction.onDismissToast
                    ),
                    duration: 3,
                    alert: {
                        AlertToast(
                            displayMode: viewStore.toastState?.mode ?? .banner(.pop),
                            type: viewStore.toastState?.type ?? .error(.appRed),
                            title: viewStore.toastState?.title,
                            subTitle: viewStore.toastState?.subtitle,
                            style: viewStore.toastState?.style
                        )
                    }
                )
            }
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
                    reducer: countryListMasterReducer,
                    environment: .live
                )
            )
            
            CountryListView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: countryListMasterReducer,
                    environment: .live
                )
            )
            
            CountryListView(
                store: Store(
                    initialState: .templateEmpty,
                    reducer: countryListMasterReducer,
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
