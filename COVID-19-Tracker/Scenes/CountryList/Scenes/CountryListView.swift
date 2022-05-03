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
    
    /// Deeplink object to observe.
    @EnvironmentObject private var deeplink: Deeplink

    let store: Store<CountryListState, CountryListAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        return WithViewStore(store) { viewStore in
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
                .background(
                    /**
                     We don't want to use the `NavigationLink` style, so we make it `.hidden()`.
                     We only want the navigation functionality as we are going to navigate programmatically
                     by listening to the state.
                     */
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: { $0.countryDetailState != nil },
                            send: { isActive in
                                CountryListAction
                                    .setNavigation(isActive: isActive)
                            }
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.countryDetailState,
                                    action: CountryListAction.countryDetail
                                ),
                                then: { CountryDetailView(store: $0) }
                            )
                        }, label: { EmptyView() }
                    )
                    .hidden()
                )
            }
            .toast(
                isPresenting: viewStore.binding(
                    get: \.isShowingToast,
                    send: CountryListAction.onDismissToast
                ),
                duration: 3,
                alert: {
                    AlertToast(
                        displayMode: .banner(.pop),
                        type: .error(.redText),
                        title: viewStore.toastState?.title,
                        subTitle: viewStore.toastState?.subtitle,
                        style: viewStore.toastState?.style
                    )
                }
            )
            .onAppear {
                viewStore.send(.onAppear)
            }
            .onChange(of: deeplink.target) { target in
                guard case .countryDetail(let id) = target else { return }
                viewStore.send(.onReceiveDeeplink(id: id))
                // Need to nil out the target to allow same deeplink target again.
                deeplink.target = nil
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
                    initialState: .templateError,
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
        .environmentObject(Deeplink())
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
