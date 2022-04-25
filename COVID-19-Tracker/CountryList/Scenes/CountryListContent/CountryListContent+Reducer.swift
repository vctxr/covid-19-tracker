//
//  CountryListContent+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import IdentifiedCollections

// MARK: - State

struct CountryListContentState: Equatable {
    private let timeseriesData: [CountryCovidTimeseries]
    var searchText: String
    var sortType: SortType
    
    // Computed properties.
    var countryCovidStates: IdentifiedArrayOf<CountryCovidState> {
        let generateStates: ([CountryCovidTimeseries]) -> IdentifiedArrayOf<CountryCovidState> = { timeseriesData in
            IdentifiedArray(uniqueElements: timeseriesData
                .sorted(by: sortType.sorter)
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
    
    // MARK: - Inits 🐣
    
    init(timeseriesData: [CountryCovidTimeseries], searchText: String, sortType: SortType) {
        self.timeseriesData = timeseriesData
        self.searchText = searchText
        self.sortType = sortType
    }
}

// MARK: - Action

enum CountryListContentAction: Equatable {
    case countryCovid(id: CountryCovidState.ID, action: Never)
}
