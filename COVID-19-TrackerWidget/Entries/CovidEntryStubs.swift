//
//  CovidEntryStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import Foundation

extension CovidEntry {
    static var placeholder: CovidEntry {
        CovidEntry(date: Date(), countriesData: Array([CovidCountryData].template.prefix(3)), isPreview: true)
    }
    
    static var template: CovidEntry {
        CovidEntry(date: Date(), countriesData: Array([CovidCountryData].template.prefix(3)), isPreview: false)
    }
    
    static var templateEmpty: CovidEntry {
        CovidEntry(date: Date(), countriesData: [], isPreview: false)
    }
}
