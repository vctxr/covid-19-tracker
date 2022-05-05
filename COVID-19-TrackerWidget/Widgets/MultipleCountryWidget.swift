//
//  MultipleCountryWidget.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit
import SwiftUI

struct MultipleCountryWidget: Widget {
    let kind: String = "MultipleCountryWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectMultipleCountryIntent.self, provider: MultipleCountryIntentTimelineProvider()) { entry in
            MultipleCountryCovidConfirmedView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("COVID-19 Stats")
        .description("View COVID-19 countries confirmed count.")
    }
}
