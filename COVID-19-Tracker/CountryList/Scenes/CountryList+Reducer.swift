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
    
    enum UIState: Equatable {
        case loading
        case loaded(state: CountryListContentState)
        
        var loadedState: CountryListContentState? {
            get { (/UIState.loaded).extract(from: self) }
            set {
                guard let countryListLoadedState = newValue else { return }
                self = .loaded(state: countryListLoadedState)
            }
        }
        
        var isLoaded: Bool {
            guard case .loaded = self else { return false }
            return true
        }
    }
}

// MARK: - Action

enum CountryListAction: Equatable {
    case onAppear
    case onSearchTextChanged(String)
    case onSortTypeChanged(SortType)
    
    // Child actions.
    case loading(Never)
    case loaded(CountryListContentAction)
    
    // Side-effects.
    case receiveCovidTimeseries(Result<[CountryCovidTimeseries], NetworkError>)
}

// MARK: - Reducer

private let countryListReducer = Reducer<CountryListState, CountryListAction, CountryListEnvironment> { state, action, env in
    switch action {
    // MARK: - Lifecycle ♻️
        
    case .onAppear:
        return env.useCase.getCovidTimeseries()
            .catchToEffect(CountryListAction.receiveCovidTimeseries)
        
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
        switch result {
        case .success(let timeseriesData):
            state.uiState = .loaded(
                state: CountryListContentState(
                    timeseriesData: timeseriesData,
                    searchText: state.searchText,
                    sortType: state.sortType
                )
            )
            
            // After getting the timeseries data, we need to trigger a filter.
            return Effect(value: .loaded(.filterCountry(searchText: state.searchText, sortedBy: state.sortType)))

        case .failure(let error):
            // TODO: Handle error
            break
        }
        
        return .none
        
    // MARK: - Unhandled
        
    case .loading:
        return .none
        
    case .loaded:
        return .none
    }
}

// MARK: - Master Reducer

internal let countryListMasterReducer = Reducer<CountryListState, CountryListAction, CountryListEnvironment>.combine(
    countryListContentReducer
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
