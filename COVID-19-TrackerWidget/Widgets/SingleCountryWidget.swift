//
//  SingleCountryWidget.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import WidgetKit
import SwiftUI

struct SingleCountryWidget: Widget {
    let kind: String = "SingleCountryWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectSingleCountryIntent.self, provider: SingleCountryIntentTimelineProvider()) { entry in
            SingleCountryCovidConfirmedView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("COVID-19 Stats")
        .description("View COVID-19 country confirmed count.")
    }
}
