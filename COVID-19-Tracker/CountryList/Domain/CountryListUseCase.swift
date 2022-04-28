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
    
    // MARK: - Covid Timeseries
    
    func getCovidTimeseries() -> AnyPublisher<[CountryCovidTimeseries], NetworkError> {
        _getCovidTimeseries()
    }
    
    lazy var _getCovidTimeseries: () -> AnyPublisher<[CountryCovidTimeseries], NetworkError> = { [networkingService] in
        networkingService.request(with: CountryListEndpoint.covidTimeseries.urlRequest)
            .map(\CovidTimeseriesResponse.countries)
            .eraseToAnyPublisher()
    }
}
