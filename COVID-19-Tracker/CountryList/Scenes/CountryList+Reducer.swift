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
    let titleText = "Countries"
    var searchText = ""
    
    // Child states.
    private var _uiState: UIState
    var uiState: UIState {
        get {
            var state = _uiState
            state.loadedState?.searchText = searchText
            return state
        }
        set {
            _uiState = newValue
            guard let newSearchText = newValue.loadedState?.searchText else { return }
            searchText = newSearchText
        }
    }
    
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
    }
    
    // MARK: - Inits 🐣
    
    init(uiState: UIState = .loading) {
        self._uiState = uiState
    }
}

// MARK: - Action

enum CountryListAction: Equatable {
    case onAppear
    case onSearchTextChanged(String)
    
    // Child actions.
    case loading(Never)
    case loaded(CountryListContentAction)
    
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
            
            state.uiState = .loaded(
                state: CountryListContentState(
                    timeseriesData: sortedTimeseriesData,
                    searchText: state.searchText
                )
            )
            
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
