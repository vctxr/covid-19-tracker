//
//  MultipleCountryEntry.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit

struct MultipleCountryEntry: TimelineEntry {
    let date: Date
    let countriesData: [CovidCountryData]
    let isPreview: Bool
}
