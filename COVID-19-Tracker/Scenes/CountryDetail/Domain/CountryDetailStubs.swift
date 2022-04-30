//
//  CountryDetailStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

#if DEBUG
import Foundation

// MARK: - CountryDetailState

extension CountryDetailState {
    static var template: CountryDetailState {
        CountryDetailState(data: .template)
    }
}

// MARK: - CovidEntryLegendState

extension CovidEntryLegendState {
    static var template: CovidEntryLegendState {
        CovidEntryLegendState(entry: .template, valueKey: "Confirmed")
    }
}

// MARK: - CovidEntry

extension CovidEntry {
    static var template: CovidEntry {
        CovidEntry(dateString: "30-04-2022", value: 1_000_000)
    }
}
#endif
