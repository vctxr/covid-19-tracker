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
    var countriesData: [CovidCountryData]
    var isRefreshing = false
    
    // Computed properties.
    var covidCountryStates: IdentifiedArrayOf<CovidCountryCardState> {
        IdentifiedArray(uniqueElements: countriesData
            .enumerated()
            .map { index, data in
                CovidCountryCardState(data: data, style: .init(index: index))
            }
        )
    }
}

// MARK: - Action

enum CountryListAvailableAction: Equatable {
    case onRefresh
    
    // Child actions.
    case covidCountryCard(id: CovidCountryCardState.ID, action: CovidCountryCardAction)
}

// MARK: - Reducer

let countryListAvailableReducer = Reducer<CountryListAvailableState, CountryListAvailableAction, Void> { state, action, _ in
    switch action {
    // MARK: - Refresh
        
    case .onRefresh:
        state.isRefreshing = true
        return .none
        
    // MARK: - Unhandled
        
    case .covidCountryCard:
        return .none
    }
}
