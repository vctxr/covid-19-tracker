//
//  FetchCovidCountriesOperation.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import AsyncOperation
import Networking
import Combine

final class FetchCovidCountriesOperation: ChainedAsyncResultOperation<Void, [CovidCountryData], OperationError> {
    private let networkingService = NetworkingService()
    private var cancellable: AnyCancellable?
    
    override func main() {
        if isFinished { return }
        fetchCovidCountries()
    }
    
    override func cancel() {
        cancellable?.cancel()
        cancellable = nil
        cancel(with: .operationError(.canceled))
    }
    
    // MARK: - Private Methods 🔒
    
    private func fetchCovidCountries() {        
        cancellable = networkingService.request(with: CountryListEndpoint.covidCountries.urlRequest)
            .map(\CovidCountriesResponse.countriesData)
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .finished:
                    break
                case let .failure(error):
                    self.finish(with: .failure(.networkError(error)))
                }
                self.cancellable?.cancel()
            } receiveValue: { [weak self] value in
                self?.finish(with: .success(value))
            }
    }
}
