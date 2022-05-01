//
//  COVID_19_TrackerWidget.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit
import SwiftUI

@main
struct COVID_19_TrackerWidget: Widget {
    let kind: String = "COVID_19_TrackerWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CovidTimelineProvider()) { entry in
            CovidWidgetMediumView(
                entry: CovidEntry(
                    date: entry.date,
                    timeseriesData: Array(
                        entry.timeseriesData
                            .sorted(by: SortType.cases(.descending).sorter)
                            .prefix(3)
                    )
                )
            )
        }
        .configurationDisplayName("COVID-19 Stats")
        .description("View COVID-19 stats and track the statistics throughout the day.")
    }
}
