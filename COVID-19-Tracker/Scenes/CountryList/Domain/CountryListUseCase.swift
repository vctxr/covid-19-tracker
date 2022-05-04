//
//  CountryListUseCase.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation
import Networking
import Combine

final class CountryListUseCase {
    // MARK: - Variables 📦
    
    private let networkingService = NetworkingService(logLevel: .info)
    private let dataStore = CovidCountriesDataStore()
    
    // MARK: - Covid Countries
    
    func getCovidCountries() -> AnyPublisher<[CovidCountryData], NetworkError> {
        _getCovidCountries()
    }
    
    lazy var _getCovidCountries: () -> AnyPublisher<[CovidCountryData], NetworkError> = { [networkingService] in
        networkingService.request(with: CountryListEndpoint.covidCountries.urlRequest)
            .map(\CovidCountriesResponse.countriesData)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Save to File
    
    func saveToDisk(countriesData: [CovidCountryData]) -> AnyPublisher<Bool, Never> {
        _saveToDisk(countriesData)
    }
    
    lazy var _saveToDisk: ([CovidCountryData]) -> AnyPublisher<Bool, Never> = { [dataStore] countriesData in
        Future { promise in
            dataStore.saveToDisk(countriesData: countriesData, dataType: .topFiftyConfirmed) { error in
                if let error = error {
                    promise(.success(false))
                } else {
                    promise(.success(true))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
