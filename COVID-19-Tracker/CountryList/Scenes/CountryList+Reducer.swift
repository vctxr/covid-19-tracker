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
    let titleText = "COVID-19 Tracker"
    var searchText = ""
    var uiState = UIState.loading
    
    enum UIState: Equatable {
        case loading
        case loaded(state: CountryListLoadedState)
    }
}

// MARK: - Action

enum CountryListAction: Equatable {
    case onAppear
    case onSearchTextChanged(String)
    
    // Child actions.
    case loading(Never)
    case loaded(CountryListLoadedAction)
    
    // Side-effects.
    case receiveCovidTimeseries(Result<[CountryCovidTimeseries], NetworkError>)
}

// MARK: - Reducer

let countryListReducer = Reducer<CountryListState, CountryListAction, CountryListEnvironment> { state, action, env in
    switch action {
    // MARK: - Lifecycle ♻️
        
    case .onAppear:
        return env.useCase.getCovidTimeseries()
            .catchToEffect(CountryListAction.receiveCovidTimeseries)
        
    // MARK: - Search Bar
        
    case .onSearchTextChanged(let text):
        state.searchText = text
        return .none
        
    // MARK: - Timeseries Response
        
    case .receiveCovidTimeseries(let result):
        switch result {
        case .success(let timeseriesData):
            let sortedTimeseriesData = timeseriesData.sorted(by: { $0.latestConfirmed > $1.latestConfirmed })
            state.uiState = .loaded(state: CountryListLoadedState(timeseriesData: sortedTimeseriesData))
        case .failure(let error):
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
