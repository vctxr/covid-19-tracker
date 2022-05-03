//
//  CountryListStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

#if DEBUG
import ComposableArchitecture
import SharedDateFormatter

// MARK: - CountryListState

extension CountryListState {
    static var templateRedacted: CountryListState {
        CountryListState(uiState: .loading)
    }
    
    static var templateAvailable: CountryListState {
        CountryListState(uiState: .loaded(state: .templateAvailable))
    }
    
    static var templateError: CountryListState {
        CountryListState(uiState: .error)
    }
    
    static var templateEmpty: CountryListState {
        CountryListState(uiState: .loaded(state: .templateEmpty))
    }
}

// MARK: - CountryListAvailableState

extension CountryListAvailableState {
    static var template: CountryListAvailableState {
        CountryListAvailableState(countriesData: .template)
    }
}

// MARK: - CovidCountryCardState

extension CovidCountryCardState {
    static var templateFirst: CovidCountryCardState {
        CovidCountryCardState(data: .template, style: .first)
    }

    static var templateSecond: CovidCountryCardState {
        CovidCountryCardState(data: .template, style: .second)
    }

    static var templateThird: CovidCountryCardState {
        CovidCountryCardState(data: .template, style: .third)
    }

    static var templateNormal: CovidCountryCardState {
        CovidCountryCardState(data: .template, style: .normal)
    }
}
#endif

// MARK: - CovidCountryData

extension CovidCountryData {
    static var template: CovidCountryData {
        .template(countryName: "Indonesia")
    }
}

// MARK: - CountryListContentState

extension CountryListContentState {
    static var templateAvailable: CountryListContentState {
        CountryListContentState(countriesData: .template)
    }
    
    static var templateEmpty: CountryListContentState {
        CountryListContentState(countriesData: [])
    }
}

// MARK: - CountryListLoadedState Empty Store

extension Store where State == CountryListContentState, Action == CountryListContentAction {
    static var empty: Self {
        Self(
            initialState: .templateAvailable,
            reducer: .empty,
            environment: ()
        )
    }
}
