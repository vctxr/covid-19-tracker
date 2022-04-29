//
//  CountryListAvailable+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 26/04/22.
//

import IdentifiedCollections
import ComposableArchitecture

// MARK: - State

struct CountryListAvailableState: Equatable {
    var timeseriesData: [CountryCovidTimeseries]
    var isRefreshing = false
    
    // Child states.
    var countryDetailState: CountryDetailState?
    
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
    case setNavigation(isActive: Bool)
    
    // Child actions.
    case countryCovid(id: CountryCovidCardState.ID, action: CountryCovidCardAction)
    case countryDetail(CountryDetailAction)
}

// MARK: - Reducer

let countryListAvailableReducer = Reducer<CountryListAvailableState, CountryListAvailableAction, Void> { state, action, _ in
    switch action {
    case .onRefresh:
        state.isRefreshing = true
        return .none
        
    case .setNavigation(isActive: true):
        state.countryDetailState = CountryDetailState()
        return .none
        
    case .setNavigation(isActive: false):
        state.countryDetailState = nil
        return .none
        
    case .countryCovid(let id, .onTapCard):
        return Effect(value: .setNavigation(isActive: true))
    }
}
