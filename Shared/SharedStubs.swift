//
//  Stubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import Foundation
import SharedDateFormatter

// MARK: - CountryCovidTimeseries

extension CountryCovidTimeseries {
    static func template(countryName: String) -> CountryCovidTimeseries {
        CountryCovidTimeseries(
            countryName: countryName,
            timeseriesData: (0..<100).map { i in
                .init(
                    dateString: SharedDateFormatter.shared
                        .formatter(withFormat: "yyyy-MM-dd")
                        .string(from: Date(timeIntervalSince1970: TimeInterval(i * 86400))),    // Stride by 1 day.
                    confirmed: Int.random(in: 0...99_999_999),
                    deaths: Int.random(in: 0...99_999_999),
                    recovered: Int.random(in: 0...99_999_999)
                )
            }
        )
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
