//
//  CountryListStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

#if DEBUG
import Foundation
import ComposableArchitecture

// MARK: - CountryCovidTimeseries Array

extension Array where Element == CountryCovidTimeseries {
    static var template: Self {
        [
            .init(country: "Indonesia", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "United Kingdom", timeseriesData: [.init(date: Date(), confirmed: 10_000, deaths: 1_000, recovered: 1_000)]),
            .init(country: "Malaysia", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Japan", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Korea", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "US", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Canada", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "France", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Brazil", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Denmark", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Germany", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Diamond Princess", timeseriesData: [.init(date: Date(), confirmed: 10_000, deaths: 1_000, recovered: 1_000)]),
            .init(country: "Taiwan", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Switzerland", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Singapore", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Kenya", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "India", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Uruguay", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "San Marino", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Marshall Islands", timeseriesData: [.init(date: Date(), confirmed: 1_000, deaths: 100, recovered: 100)]),
            .init(country: "Antartica", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Finland", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Hungary", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Sierra Leone", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Colombia", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Chile", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
            .init(country: "Phillipines", timeseriesData: [.init(date: Date(), confirmed: 1_000_000, deaths: 10_000, recovered: 10_000)]),
        ]
    }
}

extension CountryListState {
    static var templateRedacted: CountryListState {
        CountryListState(uiState: .loading)
    }
    
    static var templateLoaded: CountryListState {
        CountryListState(uiState: .loaded(state: .template))
    }
}

// MARK: - CountryListLoadedState

extension CountryListLoadedState {
    static var template: CountryListLoadedState {
        CountryListLoadedState(timeseriesData: .template, searchText: "")
    }
}

// MARK: - CountryCovidState

extension CountryCovidState {
    static var templateFirst: CountryCovidState {
        CountryCovidState(data: .template, style: .first)
    }

    static var templateSecond: CountryCovidState {
        CountryCovidState(data: .template, style: .second)
    }

    static var templateThird: CountryCovidState {
        CountryCovidState(data: .template, style: .third)
    }

    static var templateNormal: CountryCovidState {
        CountryCovidState(data: .template, style: .normal)
    }
}

// MARK: - CountryCovidTimeseries

extension CountryCovidTimeseries {
    static var template: CountryCovidTimeseries {
        CountryCovidTimeseries(country: "Indonesia", timeseriesData: [.init(date: Date(), confirmed: 213_372, deaths: 10, recovered: 10)])
    }
}

// MARK: - CountryListLoadedState Reducer

extension Reducer where State == CountryListLoadedState, Action == CountryListLoadedAction, Environment == Void {
    static var noop: Self {
        Reducer { _, _, _ in .none }
    }
}

// MARK: - CountryCovidState Reducer

extension Reducer where State == CountryCovidState, Action == Never, Environment == Void {
    static var noop: Self {
        Reducer { _, _, _ in .none }
    }
}
#endif

// MARK: - CountryListLoadedState Redacted Store

extension Store where State == CountryListLoadedState, Action == CountryListLoadedAction {
    static var redacted: Self {
        Self(
            initialState: .template,
            reducer: .noop,
            environment: ()
        )
    }
}
