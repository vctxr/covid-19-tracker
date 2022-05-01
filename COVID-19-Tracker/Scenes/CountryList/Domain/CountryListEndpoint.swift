//
//  CountryListEndpoint.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import Networking

enum CountryListEndpoint {
    case covidCountries
}

extension CountryListEndpoint: Endpoint {
    var baseUrl: String {
        "https://pomber.github.io"
    }
    
    var path: String {
        switch self {
        case .covidCountries:
            return "/covid19/timeseries.json"
        }
    }
    
    var urlParameters: [URLQueryItem] {
        switch self {
        case .covidCountries:
            return []
        }
    }
}
