//
//  CountryDetail+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import ComposableArchitecture

// MARK: - State

struct CountryDetailState: Equatable {
    let data: CountryCovidTimeseries
    var safariState: URL?
}

// MARK: - Action

enum CountryDetailAction: Equatable {
    case setSafariView(isPresented: Bool)
}

// MARK: - Reducer

let countryDetailReducer = Reducer<CountryDetailState, CountryDetailAction, Void> { state, action, _ in
    switch action {
    case .setSafariView(isPresented: true):
        state.safariState = URL(string: "https://www.who.int/health-topics/coronavirus#tab=tab_1")
        return .none
        
    case .setSafariView(isPresented: false):
        state.safariState = nil
        return .none
    }
}
