//
//  CountryDetail+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import ComposableArchitecture

// MARK: - State

struct CountryDetailState: Equatable {
    let data: CovidCountryData
    var selectedChart = ChartMode.confirmed
    var safariState: URL?
    
    var chartEntries: [CovidChartEntry] {
        data.timeseriesData.map { data in
            let value: Int = {
                switch selectedChart {
                case .confirmed:
                    return data.confirmed
                case .active:
                    return data.active
                }
            }()
        
            return CovidChartEntry(dateString: data.dateString, value: value)
        }
    }
}

// MARK: - Action

enum CountryDetailAction: Equatable {
    case onSelectedChartChanged(ChartMode)
    case setSafariView(isPresented: Bool)
}

// MARK: - Reducer

let countryDetailReducer = Reducer<CountryDetailState, CountryDetailAction, Void> { state, action, _ in
    switch action {
    case .onSelectedChartChanged(let newChartMode):
        state.selectedChart = newChartMode
        return .none
            
    case .setSafariView(isPresented: true):
        state.safariState = URL(string: "https://www.who.int/health-topics/coronavirus#tab=tab_1")
        return .none
        
    case .setSafariView(isPresented: false):
        state.safariState = nil
        return .none
    }
}
