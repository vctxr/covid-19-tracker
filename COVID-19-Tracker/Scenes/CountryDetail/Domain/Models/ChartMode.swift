//
//  ChartMode.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import Foundation

enum ChartMode: Equatable {
    case confirmed
    case active
    
    var titleText: String {
        switch self {
        case .confirmed:
            return "Confirmed cases"
        case .active:
            return "Active cases"
        }
    }
    
    var legendText: String {
        switch self {
        case .confirmed:
            return "Confirmed"
        case .active:
            return "Active"
        }
    }
}
