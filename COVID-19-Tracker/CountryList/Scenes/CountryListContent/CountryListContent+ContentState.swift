//
//  CountryListContent+ContentState.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import CasePaths

extension CountryListContentState {
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
}
