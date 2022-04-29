//
//  CountryListStubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

#if DEBUG
import ComposableArchitecture

// MARK: - CountryListState

extension CountryListState {
    static var templateRedacted: CountryListState {
        CountryListState(uiState: .loading)
    }
    
    static var templateAvailable: CountryListState {
        CountryListState(uiState: .loaded(state: .templateAvailable))
    }
    
    static var templateError: CountryListState {
        CountryListState(uiState: .error)
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
    static func template(countryName: String) -> CountryCovidTimeseries {
        CountryCovidTimeseries(
            countryName: countryName,
            timeseriesData: [
                .init(
                    dateString: "2022-1-22",
                    confirmed: Int.random(in: 0...99_999_999),
                    deaths: Int.random(in: 0...99_999_999),
                    recovered: Int.random(in: 0...99_999_999)
                )
            ]
        )
    }
    
    static var template: CountryCovidTimeseries {
        .template(countryName: "Indonesia")
    }
}

// MARK: - CountryCovidTimeseries Array

extension Array where Element == CountryCovidTimeseries {
    static let template: [CountryCovidTimeseries] = [
        .template(countryName: "Indonesia"),
        .template(countryName: "United Kingdom"),
        .template(countryName: "Japan"),
        .template(countryName: "Korea"),
        .template(countryName: "US"),
        .template(countryName: "Canada"),
        .template(countryName: "Diamond Princess"),
        .template(countryName: "Taiwan"),
        .template(countryName: "Switzerland"),
        .template(countryName: "Marshall Islands"),
        .template(countryName: "Antartica"),
        .template(countryName: "Sierra Leone")
    ]
}

// MARK: - CountryListLoadedState

extension CountryListContentState {
    static var templateAvailable: CountryListContentState {
        CountryListContentState(timeseriesData: .template)
    }
    
    static var templateEmpty: CountryListContentState {
        CountryListContentState(timeseriesData: [])
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
