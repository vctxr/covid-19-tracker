//
//  CountryListContent+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import ComposableArchitecture
import IdentifiedCollections
import CasePaths

// MARK: - State

struct CountryListContentState: Equatable {
    let countriesData: [CovidCountryData]
    var contentState: ContentState
    
    // MARK: - Inits 🐣
    
    init(countriesData: [CovidCountryData]) {
        self.countriesData = countriesData
        
        if countriesData.isEmpty {
            contentState = .empty
        } else {
            contentState = .available(state: .init(countriesData: countriesData))
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
        // If there is no search text, just return the countries data without filtering.
        guard !searchText.isEmpty else {
            state.contentState = .available(state: .init(countriesData: state.countriesData.sorted(by: sortType.sorter)))
            return .none
        }
        
        // Filter and sort the data.
        let filteredCountriesData = state.countriesData
            .filter { $0.countryName.range(of: searchText, options: .caseInsensitive) != nil }
            .sorted(by: sortType.sorter)

        if filteredCountriesData.isEmpty {
            state.contentState = .empty
        } else {
            state.contentState = .available(state: .init(countriesData: filteredCountriesData))
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

