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
    internal var timeseriesData: [CountryCovidTimeseries]
    internal var contentState: ContentState

    enum ContentState: Equatable {
        case empty
        case available(state: CountryListAvailableState)
        
        var availableState: CountryListAvailableState? {
            get { (/ContentState.available).extract(from: self) }
            set {
                guard let countryListAvailableState = newValue else { return }
                self = .available(state: countryListAvailableState)
            }
        }
    }
    
    // MARK: - Inits 🐣
    
    init(timeseriesData: [CountryCovidTimeseries], searchText: String, sortType: SortType) {
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

let countryListContentReducer = Reducer<CountryListContentState, CountryListContentAction, Void> { state, action, _ in
    switch action {
    case .available:
        return .none
        
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
    }
}
