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
    case setNavigation(isActive: Bool, id: CountryCovidCardState.ID? = nil)
    
    // Child actions.
    case countryCovid(id: CountryCovidCardState.ID, action: CountryCovidCardAction)
    case countryDetail(CountryDetailAction)
}

// MARK: - Reducer

private let countryListAvailableReducer = Reducer<CountryListAvailableState, CountryListAvailableAction, Void> { state, action, _ in
    switch action {
    // MARK: - Refresh
        
    case .onRefresh:
        state.isRefreshing = true
        return .none
        
    // MARK: - Navigation
        
    case .setNavigation(isActive: true, let id):
        guard let id = id, let selectedState = state.countryCovidStates[id: id] else { return .none }
        state.countryDetailState = CountryDetailState(data: selectedState.data)
        return .none
        
    case .setNavigation(isActive: false, _):
        state.countryDetailState = nil
        return .none
        
    case .countryCovid(let id, .onTapCard):
        return Effect(value: .setNavigation(isActive: true, id: id))
        
    // MARK: - Unhandled
        
    case .countryDetail:
        return .none
    }
}

// MARK: - Master Reducer

let countryListAvailableMasterReducer = Reducer<CountryListAvailableState, CountryListAvailableAction, Void>.combine(
    countryDetailReducer
        .optional()
        .pullback(
            state: \.countryDetailState,
            action: /CountryListAvailableAction.countryDetail,
            environment: { $0 }
        ),
    
    countryListAvailableReducer
)
