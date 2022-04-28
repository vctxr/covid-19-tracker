//
//  CovidTimeseriesResponse.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation

// MARK: - CovidTimeseriesResponse

struct CovidTimeseriesResponse {
    let countries: [CountryCovidTimeseries]
}

extension CovidTimeseriesResponse: Decodable {
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        countries = try container.allKeys.map { key in
            let timeseriesData = try container.decode([CovidDayData].self,
                                                     forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            return CountryCovidTimeseries(country: key.stringValue, timeseriesData: timeseriesData)
        }
    }
}

// MARK: - CountryCovidTimeseries

struct CountryCovidTimeseries: Equatable, Identifiable {
    var id: String { country }

    let country: String
    let timeseriesData: [CovidDayData]
    
    var latestConfirmed: Int {
        timeseriesData.last?.confirmed ?? 0
    }
    
    var latestDeaths: Int {
        timeseriesData.last?.deaths ?? 0
    }
}

// MARK: - CovidDayData

struct CovidDayData: Equatable {
    let dateString: String
    let confirmed: Int
    let deaths: Int
    let recovered: Int
}

extension CovidDayData: Decodable {
    enum CodingKeys: CodingKey {
        case date
        case confirmed
        case deaths
        case recovered
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dateString = try container.decode(String.self, forKey: .date)
        confirmed = try container.decode(Int.self, forKey: .confirmed)
        deaths = try container.decode(Int.self, forKey: .deaths)
        recovered = try container.decode(Int.self, forKey: .recovered)
    }
}