//
//  SingleCountryEntry.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import WidgetKit

struct SingleCountryEntry: TimelineEntry {
    let date: Date
    let countryData: CovidCountryData?
    let isPreview: Bool
}
