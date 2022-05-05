//
//  Country+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import Foundation

extension Country {
    convenience init(country: CovidCountryData) {
        self.init(identifier: country.id, display: country.countryWithFlagText)
        id = country.id
    }
    
    static var topConfirmed: Country {
        Country(identifier: "top-confirmed", display: "Top Confirmed")
    }
    
    static var none: Country {
        Country(identifier: "none", display: "None")
    }
}
