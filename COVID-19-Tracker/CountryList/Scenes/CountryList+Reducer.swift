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
    
    // Child states.
    private var _uiState: UIState
    var uiState: UIState {
        get {
            var state = _uiState
            let sortedTimeseriesData = state.loadedState?.contentState.availableState?.timeseriesData.sorted(by: sortType.sorter)
            state.loadedState?.contentState.availableState?.timeseriesData = sortedTimeseriesData ?? []
            state.loadedState?.contentState.availableState?.searchText = searchText
            return state
        }
        set {
            _uiState = newValue
            guard let availableState = newValue.loadedState?.contentState.availableState else { return }
            searchText = availableState.searchText
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
    case onSortTypeChanged(SortType)
    
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
            .receive(on: DispatchQueue.main.animation())
            .catchToEffect(CountryListAction.receiveCovidTimeseries)
        
    // MARK: - Navigation Bar
        
    case .onSearchTextChanged(let text):
        state.searchText = text
        return .none
        
    case .onSortTypeChanged(let sortType):
        state.sortType = sortType
        return .none
        
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
