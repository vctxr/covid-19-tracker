//
//  CountryListAvailable+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 26/04/22.
//

import IdentifiedCollections

// MARK: - State

struct CountryListAvailableState: Equatable {
    var timeseriesData: [CountryCovidTimeseries]
    
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
    // Child actions.
    case countryCovid(id: CountryCovidCardState.ID, action: Never)
}
