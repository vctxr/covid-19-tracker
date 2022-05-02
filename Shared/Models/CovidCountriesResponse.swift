//
//  CovidCountriesResponse.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SharedDateFormatter

// MARK: - CovidCountriesResponse

struct CovidCountriesResponse {
    let countriesData: [CovidCountryData]
}

extension CovidCountriesResponse: Decodable {
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
        countriesData = try container.allKeys.map { key in
            let timeseriesData = try container.decode([CovidDayData].self,
                                                     forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            return CovidCountryData(countryName: key.stringValue, timeseriesData: timeseriesData)
        }
    }
}

// MARK: - CovidCountryData

struct CovidCountryData: Equatable, Identifiable {
    var id: String { countryName }

    let countryName: String
    let timeseriesData: [CovidDayData]
    
    var countryWithFlagText: String {
        "\(countryName) \(countryName.flag)"
    }
    
    var latestConfirmed: Int {
        timeseriesData.last?.confirmed ?? 0
    }
    
    var latestDeaths: Int {
        timeseriesData.last?.deaths ?? 0
    }
    
    var latestRecoveries: Int {
        timeseriesData.last?.recovered ?? 0
    }
    
    var latestUpdatedDateString: String {
        guard let latestDateString = timeseriesData.last?.dateString else { return "-" }
        let stringToDateFormatter = SharedDateFormatter.shared.formatter(withFormat: "yyyy-MM-dd")
        
        guard let latestDate = stringToDateFormatter.date(from: latestDateString) else { return "-" }
        let dateToStringFormatter = SharedDateFormatter.shared.formatter(withFormat: "dd-MM-yyyy")
        
        return dateToStringFormatter.string(from: latestDate)
    }
    
    var fatalityRatePercentageString: String {
        guard latestConfirmed > 0 else { return "-" }
        let percentage = (Float(latestDeaths) / Float(latestConfirmed)) * 100
        return percentage.displayString + "%"
    }
}

extension CovidCountryData: Codable {}

// MARK: - CovidDayData

struct CovidDayData: Equatable {
    let dateString: String
    let confirmed: Int
    let deaths: Int
    let recovered: Int
}

extension CovidDayData: Codable {
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dateString, forKey: .date)
        try container.encode(confirmed, forKey: .confirmed)
        try container.encode(deaths, forKey: .deaths)
        try container.encode(recovered, forKey: .recovered)
    }
}
