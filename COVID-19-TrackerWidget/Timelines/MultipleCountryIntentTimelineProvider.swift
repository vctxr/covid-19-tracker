//
//  MultipleCountryIntentTimelineProvider.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit

struct MultipleCountryIntentTimelineProvider: IntentTimelineProvider {
    // MARK: - Variables 📦
    
    private let dataStore = CovidCountriesDataStore()
    
    // MARK: - Placeholder
    
    func placeholder(in context: Context) -> MultipleCountryEntry {
        .placeholder
    }
    
    // MARK: - Snapshot
    
    func getSnapshot(for configuration: SelectMultipleCountryIntent, in context: Context, completion: @escaping (MultipleCountryEntry) -> Void) {
        loadData(for: configuration) { countriesData in
            if countriesData.isEmpty && context.isPreview {
                completion(.placeholder)
            } else {
                let entry = MultipleCountryEntry(date: Date(), countriesData: countriesData, isPreview: false)
                completion(entry)
            }
        }
    }
    
    // MARK: - Timeline
    
    func getTimeline(for configuration: SelectMultipleCountryIntent, in context: Context, completion: @escaping (Timeline<MultipleCountryEntry>) -> Void) {
        loadData(for: configuration) { countriesData in
            let entry = MultipleCountryEntry(date: Date(), countriesData: countriesData, isPreview: false)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
    
    // MARK: - Private Methods 🔒
    
    private func loadData(for configuration: SelectMultipleCountryIntent, completion: @escaping ([CovidCountryData]) -> Void) {
        switch configuration.selectionType {
        case .unknown:
            completion([])

        case .topConfirmed:
            dataStore.loadData(.topFiftyConfirmed) { countriesData in
                let topThreeConfirmed = Array(countriesData.prefix(3))
                completion(topThreeConfirmed)
            }
            
        case .countries:
            guard let selectedCountries = configuration.countries,
                  !selectedCountries.isEmpty
            else { return completion([]) }
            
            dataStore.loadData(.topFiftyConfirmed) { countriesData in
                // Get the count of the valid countries selected.
                let selectionCount = selectedCountries
                    .filter { $0.identifier != Country.none.identifier }
                    .count
                
                // If there are no selection, just return the original data.
                guard selectionCount > 0 else {
                    return completion(Array(countriesData.prefix(3)))
                }

                // Filter for only the selected countries.
                let selectedCountriesData = selectedCountries.compactMap { country -> CovidCountryData? in
                    guard let countryData = countriesData.first(where: { $0.id == country.id }) else { return nil }
                    return countryData
                }
                
                completion(selectedCountriesData)
            }
        }
    }
}
