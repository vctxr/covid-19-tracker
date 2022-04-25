//
//  SortType.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 25/04/22.
//

import Foundation

enum SortType: Hashable {
    case cases(Order)
    case fatality(Order)
    
    enum Order: Equatable {
        case ascending
        case descending
    }
    
    func sorter(_ first: CountryCovidTimeseries, _ second: CountryCovidTimeseries) -> Bool {
        switch self {
        case .cases(.descending):
            return first.latestConfirmed > second.latestConfirmed
        case .cases(.ascending):
            return first.latestConfirmed < second.latestConfirmed
        case .fatality(.descending):
            return first.latestDeaths > second.latestDeaths
        case .fatality(.ascending):
            return first.latestDeaths < second.latestDeaths
        }
    }
}
