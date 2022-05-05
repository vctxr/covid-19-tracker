//
//  Stubs.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import Foundation
import SharedDateFormatter

// MARK: - CovidCountryData

extension CovidCountryData {
    static func template(countryName: String) -> CovidCountryData {
        CovidCountryData(
            countryName: countryName,
            timeseriesData: (0..<100).map { i -> CovidDayData in
                CovidDayData(
                    dateString: SharedDateFormatter.shared
                        .formatter(withFormat: "yyyy-MM-dd")
                        .string(from: Date(timeIntervalSince1970: TimeInterval(i * 86400))),    // Stride by 1 day.
                    confirmed: 6_047_491 + i,
                    deaths: i,
                    recovered: i
                )
            }
        )
    }
}

// MARK: - CovidCountryData Array

extension Array where Element == CovidCountryData {
    static let template: [CovidCountryData] = [
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
