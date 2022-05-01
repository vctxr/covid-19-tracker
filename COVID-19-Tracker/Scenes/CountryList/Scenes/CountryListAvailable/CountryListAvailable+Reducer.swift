//
//  CountryListAvailable+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 26/04/22.
//

import ComposableArchitecture
import IdentifiedCollections

// MARK: - State

struct CountryListAvailableState: Equatable {
    var timeseriesData: [CountryCovidTimeseries]
    var isRefreshing = false
    
    // Computed properties.
    var countryCovidStates: IdentifiedArrayOf<CountryCovidCardState> {
        IdentifiedArray(uniqueElements: timeseriesData
            .enumerated()
            .map { index, data in
                CountryCovidCardState(data: data, style: .init(index: index))
            }
        )
    }
}

// MARK: - Action

enum CountryListAvailableAction: Equatable {
    case onRefresh
    
    // Child actions.
    case countryCovid(id: CountryCovidCardState.ID, action: CountryCovidCardAction)
}

// MARK: - Reducer

let countryListAvailableReducer = Reducer<CountryListAvailableState, CountryListAvailableAction, Void> { state, action, _ in
    switch action {
    // MARK: - Refresh
        
    case .onRefresh:
        state.isRefreshing = true
        return .none
        
    // MARK: - Unhandled
        
    case .countryCovid:
        return .none
    }
}
