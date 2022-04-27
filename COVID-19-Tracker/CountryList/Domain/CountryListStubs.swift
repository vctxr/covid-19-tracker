//
//  CountryListStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

#if DEBUG
import Foundation
import ComposableArchitecture

// MARK: - CountryListState

extension CountryListState {
    static var templateRedacted: CountryListState {
        CountryListState(uiState: .loading)
    }
    
    static var templateAvailable: CountryListState {
        CountryListState(uiState: .loaded(state: .templateAvailable))
    }
    
    static var templateEmpty: CountryListState {
        CountryListState(uiState: .loaded(state: .templateEmpty))
    }
}

// MARK: - CountryListAvailableState

extension CountryListAvailableState {
    static var template: CountryListAvailableState {
        CountryListAvailableState(timeseriesData: .template)
    }
}

// MARK: - CountryCovidCardState

extension CountryCovidCardState {
    static var templateFirst: CountryCovidCardState {
        CountryCovidCardState(data: .template, style: .first)
    }

    static var templateSecond: CountryCovidCardState {
        CountryCovidCardState(data: .template, style: .second)
    }

    static var templateThird: CountryCovidCardState {
        CountryCovidCardState(data: .template, style: .third)
    }

    static var templateNormal: CountryCovidCardState {
        CountryCovidCardState(data: .template, style: .normal)
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
    static let template: [CountryCovidTimeseries] = [
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
        .template(country: "Sierra Leone")
    ]
}

// MARK: - CountryListLoadedState

extension CountryListContentState {
    static var templateAvailable: CountryListContentState {
        CountryListContentState(timeseriesData: .template, searchText: "", sortType: .cases(.descending))
    }
    
    static var templateEmpty: CountryListContentState {
        CountryListContentState(timeseriesData: [], searchText: "", sortType: .cases(.descending))
    }
}

// MARK: - CountryListLoadedState Empty Store

extension Store where State == CountryListContentState, Action == CountryListContentAction {
    static var empty: Self {
        Self(
            initialState: .templateAvailable,
            reducer: .empty,
            environment: ()
        )
    }
}
