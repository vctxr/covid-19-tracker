//
//  SaveCovidCountriesToDiskOperation.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 03/05/22.
//

import AsyncOperation

typealias SaveCovidCountriesToDiskInput = Result<[CovidCountryData], OperationError>

final class SaveCovidCountriesToDiskOperation: ChainedAsyncResultOperation<SaveCovidCountriesToDiskInput, Void, OperationError> {
    private let dataStore = CovidCountriesDataStore()

    override func main() {
        if isFinished { return }
        
        switch input {
        case .success(let countriesData):
            saveToDisk(countriesData: countriesData)
        case .failure(let error):
            finish(with: .failure(error))
        default:
            finish(with: .failure(.operationError(.noInput)))
        }
    }
    
    private func saveToDisk(countriesData: [CovidCountryData]) {
        dataStore.saveToDisk(countriesData: countriesData, dataType: .topFiftyConfirmed) { [weak self] error in
            if let error = error {
                self?.finish(with: .failure(.underlyingError(error)))
            } else {
                self?.finish(with: .success(()))
            }
        }
    }
}
