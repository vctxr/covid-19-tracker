//
//  CovidTimelineProvider.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit

struct CovidTimelineProvider: TimelineProvider {
    private let dataStore = CovidCountriesDataStore()
    
    func placeholder(in context: Context) -> CovidEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidEntry) -> ()) {
        dataStore.loadData(.topThreeConfirmed) { countriesData in
            if countriesData.isEmpty && context.isPreview {
                completion(.placeholder)
            } else {
                let entry = CovidEntry(date: Date(), countriesData: countriesData, isPreview: false)
                completion(entry)
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidEntry>) -> ()) {
        dataStore.loadData(.topThreeConfirmed) { countriesData in
            let entry = CovidEntry(date: Date(), countriesData: countriesData, isPreview: false)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}
