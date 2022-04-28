//
//  CountryList+Reducer.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import ComposableArchitecture
import Networking

// MARK: - State

struct CountryListState: Equatable {
    let titleText = "Countries 🦠"
    var searchText = ""
    var sortType = SortType.cases(.descending)
    var uiState = UIState.loading
    var toastState: ToastState?
    
    // Computed properties.
    var isShowingToast: Bool {
        toastState != nil
    }
}

// MARK: - Action

enum CountryListAction: Equatable {
    case onAppear
    case onSearchTextChanged(String)
    case onSortTypeChanged(SortType)
    case onDismissToast
    
    // Child actions.
    case loading(Never)
    case loaded(CountryListContentAction)
    case error(CountryListErrorAction)
    
    // Side-effects.
    case fetchCovidTimeseries
    case receiveCovidTimeseries(Result<[CountryCovidTimeseries], NetworkError>)
    case queueLoadingState
}

// MARK: - Reducer

private let countryListReducer = Reducer<CountryListState, CountryListAction, CountryListEnvironment> { state, action, env in
    struct FetchCovidTimeseriesID: Hashable {}
    struct QueueLoadingStateID: Hashable {}
    
    switch action {
    // MARK: - Lifecycle ♻️
        
    case .onAppear:
        return Effect(value: .fetchCovidTimeseries)
        
    // MARK: - Fetch Covid Timeseries
        
    case .fetchCovidTimeseries:
        return .concatenate(
            env.useCase.getCovidTimeseries()
                .catchToEffect(CountryListAction.receiveCovidTimeseries)
                .cancellable(id: FetchCovidTimeseriesID(), cancelInFlight: true)
            ,
            .cancel(id: QueueLoadingStateID())  // Cancel loading state.
        )
        
    // MARK: - Navigation Bar
        
    case .onSearchTextChanged(let text):
        state.searchText = text
        
        // Only filter if it is loaded.
        guard state.uiState.isLoaded else { return .none }
        return Effect(value: .loaded(.filterCountry(searchText: state.searchText, sortedBy: state.sortType)))
        
    case .onSortTypeChanged(let sortType):
        state.sortType = sortType
        
        // Only filter if it is loaded.
        guard state.uiState.isLoaded else { return .none }
        return Effect(value: .loaded(.filterCountry(searchText: state.searchText, sortedBy: state.sortType)))

    // MARK: - Timeseries Response
        
    case .receiveCovidTimeseries(let result):
        state.uiState.loadedState?.contentState.availableState?.isRefreshing = false

        switch result {
        case .success(let timeseriesData):
            state.uiState = .loaded(state: CountryListContentState(timeseriesData: timeseriesData))
            
            // After getting the timeseries data, we need to trigger a filter.
            return Effect(value: .loaded(.filterCountry(searchText: state.searchText, sortedBy: state.sortType)))

        case .failure(let error):
            state.toastState = ToastState(
                mode: .banner(.pop),
                type: .error(.appRed),
                title: error.localizedDescription
            )
            
            // Only set UI state to error only if it's not loaded yet.
            guard !state.uiState.isLoaded else { return .none }
            state.uiState = .error
            
            return .none
        }
        
    // MARK: - Refresh
        
    case .loaded(.available(.onRefresh)):
        return Effect(value: .fetchCovidTimeseries)
        
    case .error(.onTapRetry):
        return .merge(
            Effect(value: .fetchCovidTimeseries),
            Effect(value: .queueLoadingState)   // Queue loading state for 0.2s to prevent flashing loading state.
                .deferred(for: 0.2, scheduler: env.mainQueue)
                .cancellable(id: QueueLoadingStateID(), cancelInFlight: true)
        )
        
    case .queueLoadingState:
        state.uiState = .loading
        return .none
        
    // MARK: - Toast
        
    case .onDismissToast:
        state.toastState = nil
        return .none
        
    // MARK: - Unhandled
        
    case .loading:
        return .none
        
    case .loaded:
        return .none
    }
}

// MARK: - Master Reducer

let countryListMasterReducer = Reducer<CountryListState, CountryListAction, CountryListEnvironment>.combine(
    countryListContentMasterReducer
        .pullback(
            state: /CountryListState.UIState.loaded,
            action: /CountryListAction.loaded,
            environment: { _ in }
        )
        .pullback(
            state: \.uiState,
            action: /CountryListAction.self,
            environment: { $0 }
        ),
    
    countryListReducer
)
