//
//  COVID_19_TrackerWidget.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit
import SwiftUI

struct COVID_19_TrackerWidget: Widget {
    let kind: String = "COVID_19_TrackerWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectCountryIntent.self, provider: CovidIntentTimelineProvider()) { entry in
            CovidConfirmedRankingView(
                entry: CovidEntry(
                    date: entry.date,
                    countriesData: entry.countriesData,
                    isPreview: entry.isPreview
                )
            )
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("COVID-19 Stats")
        .description("View COVID-19 countries confirmed count.")
    }
}
