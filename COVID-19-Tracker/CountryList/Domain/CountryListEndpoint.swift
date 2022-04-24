//
//  CountryListEndpoint.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import Networking

enum CountryListEndpoint {
    case covidTimeseries
}

extension CountryListEndpoint: Endpoint {
    var baseUrl: String {
        "https://pomber.github.io"
    }
    
    var path: String {
        switch self {
        case .covidTimeseries:
            return "/covid19/timeseries.json"
        }
    }
    
    var urlParameters: [URLQueryItem] {
        switch self {
        case .covidTimeseries:
            return []
        }
    }
}
