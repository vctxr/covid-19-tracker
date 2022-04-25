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
    var searchText: String
    
    // Computed properties.
    var countryCovidStates: IdentifiedArrayOf<CountryCovidState> {
        let generateStates: ([CountryCovidTimeseries]) -> IdentifiedArrayOf<CountryCovidState> = { timeseriesData in
            IdentifiedArray(uniqueElements: timeseriesData
                .enumerated()
                .map { index, data in
                    CountryCovidState(data: data, style: .init(index: index))
                }
            )
        }
        
        // If there is no search text, just return the timeseries data without filtering.
        guard !searchText.isEmpty else { return generateStates(timeseriesData) }
        
        let filteredData = timeseriesData
            .filter { $0.country.range(of: searchText, options: .caseInsensitive) != nil }

        return generateStates(filteredData)
    }
}

// MARK: - Action

enum CountryListAvailableAction: Equatable {
    case countryCovid(id: CountryCovidState.ID, action: Never)
}