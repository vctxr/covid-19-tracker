//
//  CountryCovidCard+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 24/04/22.
//

import SwiftUI

// MARK: - State

struct CountryCovidCardState: Equatable, Identifiable {
    var id: String { data.id }
    
    let data: CountryCovidTimeseries
    let style: Style
}
