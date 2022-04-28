//
//  CountryListContent+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import IdentifiedCollections
import CasePaths
import ComposableArchitecture

// MARK: - State

struct CountryListContentState: Equatable {
    let timeseriesData: [CountryCovidTimeseries]
    var contentState: ContentState
    
    // MARK: - Inits 🐣
    
    init(timeseriesData: [CountryCovidTimeseries]) {
        self.timeseriesData = timeseriesData
        
        if timeseriesData.isEmpty {
            contentState = .empty
        } else {
            contentState = .available(state: .init(timeseriesData: timeseriesData))
        }
    }
}

// MARK: - Action

enum CountryListContentAction: Equatable {    
    // Child actions.
    case empty(Never)
    case available(CountryListAvailableAction)
    
    // Side-effects.
    case filterCountry(searchText: String, sortedBy: SortType)
}

// MARK: - Reducer

private let countryListContentReducer = Reducer<CountryListContentState, CountryListContentAction, Void> { state, action, _ in
    switch action {
    case .filterCountry(let searchText, let sortType):
        // If there is no search text, just return the timeseries data without filtering.
        guard !searchText.isEmpty else {
            state.contentState = .available(state: .init(timeseriesData: state.timeseriesData.sorted(by: sortType.sorter)))
            return .none
        }
        
        // Filter and sort the data.
        let filteredTimeseriesData = state.timeseriesData
            .filter { $0.country.range(of: searchText, options: .caseInsensitive) != nil }
            .sorted(by: sortType.sorter)

        if filteredTimeseriesData.isEmpty {
            state.contentState = .empty
        } else {
            state.contentState = .available(state: .init(timeseriesData: filteredTimeseriesData))
        }
        
        return .none
        
    // MARK: - Unhandled
        
    case .available:
        return .none
    }
}

// MARK: - Master Reducer

let countryListContentMasterReducer = Reducer<CountryListContentState, CountryListContentAction, Void>.combine(
    countryListAvailableReducer
        .pullback(
            state: /CountryListContentState.ContentState.available,
            action: /CountryListContentAction.available,
            environment: { _ in }
        )
        .pullback(
            state: \.contentState,
            action: /CountryListContentAction.self,
            environment: { $0 }
        ),
    
    countryListContentReducer
)

