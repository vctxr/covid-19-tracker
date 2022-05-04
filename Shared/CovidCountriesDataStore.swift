//
//  CovidCountriesDataStore.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

final class CovidCountriesDataStore {
    // MARK: - Variables 📦
    
    private let baseURL = FileManager.default.sharedContainerURL()
        .appendingPathComponent("covid_countries", isDirectory: true)
        
    // MARK: - Methods ⛓
    
    func saveToDisk(countriesData: [CovidCountryData], dataType: DataType, completion: @escaping (Error?) -> Void) {
        createBaseDirectoryIfNeeded()
        
        let saveURL = baseURL.appendingPathComponent(dataType.fileName)
        
        DispatchQueue.global().async {
            do {
                let transformedData: [CovidCountryData] = {
                    switch dataType {
                    case .topFiftyConfirmed:
                        return Array(countriesData.sorted(by: SortType.cases(.descending).sorter).prefix(50))
                    }
                }()
                
                let dataToSave = try JSONEncoder().encode(transformedData)
                try dataToSave.write(to: saveURL)
                
                debugPrint("✅ Saved to file")
                completion(nil)
            } catch {
                debugPrint("❌ Error saving to file: \(error.localizedDescription)")
                completion(error)
            }
        }
    }
    
    func loadData(_ dataType: DataType, completion: @escaping ([CovidCountryData]) -> Void) {
        let fileURL = baseURL.appendingPathComponent(dataType.fileName)

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: fileURL, options: [.uncached, .mappedIfSafe])
                let countriesData = try JSONDecoder().decode([CovidCountryData].self, from: data)
                debugPrint("✅ Success loading file")
                completion(countriesData)
            } catch {
                debugPrint("❌ Error loading file: \(error.localizedDescription)")
                completion([])
            }
        }
    }
    
    // MARK: - Private Methods 🔒
    
    private func createBaseDirectoryIfNeeded() {
        guard !FileManager.default.fileExists(atPath: baseURL.path) else { return }
        do {
            try FileManager.default.createDirectory(at: baseURL, withIntermediateDirectories: true)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

// MARK: -  DataType

extension CovidCountriesDataStore {
    enum DataType {
        case topFiftyConfirmed
        
        var fileName: String {
            switch self {
            case .topFiftyConfirmed:
                return "top_fifty_confirmed.json"
            }
        }
    }
}
