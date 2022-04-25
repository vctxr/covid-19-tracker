//
//  CountryListStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

#if DEBUG
import Foundation
import ComposableArchitecture

extension CountryListState {
    static var templateRedacted: CountryListState {
        CountryListState(uiState: .loading)
    }
    
    static var templateLoaded: CountryListState {
        CountryListState(uiState: .loaded(state: .template))
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
#endif

// MARK: - CountryCovidTimeseries

extension CountryCovidTimeseries {
    static func template(country: String) -> CountryCovidTimeseries {
        CountryCovidTimeseries(
            country: country,
            timeseriesData: [
                .init(
                    date: Date(),
                    confirmed: Int.random(in: 0...99_999_999),
                    deaths: Int.random(in: 0...99_999_999),
                    recovered: Int.random(in: 0...99_999_999)
                )
            ]
        )
    }
    
    static var template: CountryCovidTimeseries {
        .template(country: "Indonesia")
    }
}

// MARK: - CountryCovidTimeseries Array

extension Array where Element == CountryCovidTimeseries {
    static var template: Self {
        [
            .template(country: "Indonesia"),
            .template(country: "United Kingdom"),
            .template(country: "Japan"),
            .template(country: "Korea"),
            .template(country: "US"),
            .template(country: "Canada"),
            .template(country: "Diamond Princess"),
            .template(country: "Taiwan"),
            .template(country: "Switzerland"),
            .template(country: "Marshall Islands"),
            .template(country: "Antartica"),
            .template(country: "Sierra Leone"),

        ]
    }
}

// MARK: - CountryListLoadedState

extension CountryListContentState {
    static var template: CountryListContentState {
        CountryListContentState(timeseriesData: .template, searchText: "", sortType: .cases(.descending))
    }
}

// MARK: - CountryListLoadedState Redacted Store

extension Store where State == CountryListContentState, Action == CountryListContentAction {
    static var redacted: Self {
        Self(
            initialState: .template,
            reducer: .empty,
            environment: ()
        )
    }
}
