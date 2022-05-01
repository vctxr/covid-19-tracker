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
    
    var titleText: String {
        switch self {
        case .cases(.descending):
            return "Most Cases 🤧"
        case .cases(.ascending):
            return "Least Cases 😷"
        case .fatality(.descending):
            return "Highest Fatality 💀"
        case .fatality(.ascending):
            return "Lowest Fatality 💉"
        }
    }
    
    func sorter(_ first: CovidCountryData, _ second: CovidCountryData) -> Bool {
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
