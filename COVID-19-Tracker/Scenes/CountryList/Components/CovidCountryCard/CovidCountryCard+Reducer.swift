//
//  CovidCountryCard+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 24/04/22.
//

import Foundation

// MARK: - State

struct CovidCountryCardState: Equatable, Identifiable {
    var id: String { data.id }
    
    let data: CovidCountryData
    let style: Style
}

// MARK: - Action

enum CovidCountryCardAction: Equatable {
    case onTapCard
}
