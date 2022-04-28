//
//  CountryList+UIState.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import CasePaths

extension CountryListState {
    enum UIState: Equatable {
        case loading
        case loaded(state: CountryListContentState)
        case error
        
        var loadedState: CountryListContentState? {
            get { (/UIState.loaded).extract(from: self) }
            set {
                guard let countryListLoadedState = newValue else { return }
                self = .loaded(state: countryListLoadedState)
            }
        }
        
        var isLoaded: Bool {
            guard case .loaded = self else { return false }
            return true
        }
    }
}
