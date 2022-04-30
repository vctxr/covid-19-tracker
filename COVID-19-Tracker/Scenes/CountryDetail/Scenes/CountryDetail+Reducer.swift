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
    var selectedChart = ChartMode.confirmed
    var entryLegendState: CovidEntryLegendState?
    var safariState: URL?
    
    var chartData: [CovidEntry] {
        data.timeseriesData.map { data in
            let value: Int = {
                switch selectedChart {
                case .confirmed:
                    return data.confirmed
                case .active:
                    return data.confirmed - data.recovered - data.deaths
                }
            }()
        
            return CovidEntry(dateString: data.dateString, value: value)
        }
    }
}

// MARK: - Action

enum CountryDetailAction: Equatable {
    case onSelectedChartChanged(ChartMode)
    case onHighlightedEntryChanged(CovidEntry?)
    case setSafariView(isPresented: Bool)
}

// MARK: - Reducer

let countryDetailReducer = Reducer<CountryDetailState, CountryDetailAction, Void> { state, action, _ in
    switch action {
    case .onSelectedChartChanged(let newChartMode):
        state.selectedChart = newChartMode
        state.entryLegendState = nil
        return .none
        
    case .onHighlightedEntryChanged(let newEntry):
        if let newEntry = newEntry {
            state.entryLegendState = CovidEntryLegendState(entry: newEntry, valueKey: state.selectedChart.legendText)
        } else {
            state.entryLegendState = nil
        }
        return .none
        
    case .setSafariView(isPresented: true):
        state.safariState = URL(string: "https://www.who.int/health-topics/coronavirus#tab=tab_1")
        return .none
        
    case .setSafariView(isPresented: false):
        state.safariState = nil
        return .none
    }
}
