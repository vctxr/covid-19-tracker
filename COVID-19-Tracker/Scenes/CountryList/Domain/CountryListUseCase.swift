//
//  CountryListUseCase.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Networking
import Combine

final class CountryListUseCase {
    // MARK: - Variables 📦
    
    private let networkingService = NetworkingService(logLevel: .info)
    
    // MARK: - Covid Countries
    
    func getCovidCountries() -> AnyPublisher<[CovidCountryData], NetworkError> {
        _getCovidCountries()
    }
    
    lazy var _getCovidCountries: () -> AnyPublisher<[CovidCountryData], NetworkError> = { [networkingService] in
        networkingService.request(with: CountryListEndpoint.covidCountries.urlRequest)
            .map(\CovidCountriesResponse.countriesData)
            .eraseToAnyPublisher()
    }
}
