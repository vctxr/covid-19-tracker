//
//  CountryEntryStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import Foundation

// MARK: - MultipleCountryEntry

extension MultipleCountryEntry {
    static var placeholder: MultipleCountryEntry {
        MultipleCountryEntry(date: Date(), countriesData: Array([CovidCountryData].template.prefix(3)), isPreview: true)
    }
    
    static var template: MultipleCountryEntry {
        MultipleCountryEntry(date: Date(), countriesData: Array([CovidCountryData].template.prefix(3)), isPreview: false)
    }
    
    static var templateEmpty: MultipleCountryEntry {
        MultipleCountryEntry(date: Date(), countriesData: [], isPreview: false)
    }
}

// MARK: - SingleCountryEntry

extension SingleCountryEntry {
    static var placeholder: SingleCountryEntry {
        SingleCountryEntry(date: Date(), countryData: .template(countryName: "Indonesia"), isPreview: true)
    }
    
    static var template: SingleCountryEntry {
        SingleCountryEntry(date: Date(), countryData: .template(countryName: "Indonesia"), isPreview: false)
    }
    
    static var templateEmpty: SingleCountryEntry {
        SingleCountryEntry(date: Date(), countryData: nil, isPreview: false)
    }
}
