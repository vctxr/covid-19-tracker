//
//  SingleCountryIntentTimelineProvider.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import WidgetKit

struct SingleCountryIntentTimelineProvider: IntentTimelineProvider {
    // MARK: - Variables 📦
    
    private let dataStore = CovidCountriesDataStore()
    
    // MARK: - Placeholder
    
    func placeholder(in context: Context) -> SingleCountryEntry {
        .placeholder
    }
    
    // MARK: - Snapshot
    
    func getSnapshot(for configuration: SelectSingleCountryIntent, in context: Context, completion: @escaping (SingleCountryEntry) -> Void) {
        loadData(for: configuration) { countryData in
            if countryData == nil && context.isPreview {
                completion(.placeholder)
            } else {
                let entry = SingleCountryEntry(date: Date(), countryData: countryData, isPreview: false)
                completion(entry)
            }
        }
    }
    
    // MARK: - Timeline
    
    func getTimeline(for configuration: SelectSingleCountryIntent, in context: Context, completion: @escaping (Timeline<SingleCountryEntry>) -> Void) {
        loadData(for: configuration) { countryData in
            let entry = SingleCountryEntry(date: Date(), countryData: countryData, isPreview: false)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
    
    // MARK: - Private Methods 🔒
    
    private func loadData(for configuration: SelectSingleCountryIntent, completion: @escaping (CovidCountryData?) -> Void) {
        dataStore.loadData(.topFiftyConfirmed) { countriesData in
            guard let selectedCountry = configuration.country,
                  let countryData = countriesData.first(where: { $0.id == selectedCountry.id })
            else { return completion(countriesData.first) }
            
            completion(countryData)
        }
    }
}
