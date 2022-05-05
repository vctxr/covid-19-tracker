//
//  SingleCountryCovidView.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import SwiftUI
import WidgetKit

struct SingleCountryCovidView: View {
    // MARK: - Variables 📦
    
    @Environment(\.widgetFamily) private var widgetFamily

    let entry: SingleCountryIntentTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            SingleCountryOneChartView(entry: entry)
                .widgetURL(entry.countryData?.deeplinkURL)
        default:
            SingleCountryTwoChartView(entry: entry)
                .widgetURL(entry.countryData?.deeplinkURL)
        }
    }
}

// MARK: - Previews 📷

struct SingleCountryCovidView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            SingleCountryCovidView(entry: .placeholder)
            SingleCountryCovidView(entry: .template)
            SingleCountryCovidView(entry: .templateEmpty)
        }
    }
    
    static var previews: some View {
        groupPreviews
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        groupPreviews
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
