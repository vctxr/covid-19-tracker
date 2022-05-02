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
