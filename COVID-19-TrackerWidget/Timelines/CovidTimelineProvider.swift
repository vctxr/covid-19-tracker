//
//  CovidTimelineProvider.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit

struct CovidTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> CovidEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidEntry) -> ()) {
        completion(.placeholder)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidEntry>) -> ()) {
        let timeline = Timeline(entries: [CovidEntry.placeholder], policy: .never)
        completion(timeline)
    }
}
