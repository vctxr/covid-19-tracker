//
//  CountryListLoaded+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import IdentifiedCollections

// MARK: - State

struct CountryListLoadedState: Equatable {
    private let timeseriesData: [CountryCovidTimeseries]
    
    var countryCovidStates: IdentifiedArrayOf<CountryCovidState> {
        IdentifiedArray(uniqueElements: timeseriesData.enumerated().map { index, data in
            CountryCovidState(data: data, style: .init(index: index))
        })
    }
    
    init(timeseriesData: [CountryCovidTimeseries]) {
        self.timeseriesData = timeseriesData
    }
}

// MARK: - Action

enum CountryListLoadedAction: Equatable {
    case countryCovid(id: CountryCovidState.ID, action: Never)
}
