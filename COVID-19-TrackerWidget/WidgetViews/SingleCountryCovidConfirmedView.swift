//
//  SingleCountryCovidConfirmedView.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import SwiftUI
import WidgetKit
import LightChart
import ColorPalette

struct SingleCountryCovidConfirmedView: View {
    // MARK: - Variables 📦
    
    let entry: SingleCountryIntentTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        VStack {
            if let countryData = entry.countryData {
                HStack {
                    Text(countryData.countryWithFlagText)
                        .font(.headline.bold())
                    Spacer()
                }
                
                LightChartView(
                    data: countryData.timeseriesData.map { Double($0.confirmed) },
                    type: .curved,
                    visualType: .customFilled(
                        color: .red,
                        lineWidth: 3,
                        fillGradient: LinearGradient(
                            colors: [
                                Color.red900Color.opacity(0.6),
                                Color.red900Color.opacity(0)
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    ),
                    offset: 0.2,
                    currentValueLineType: .dash(color: .gray, lineWidth: 1, dash: [5])
                )
                            
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("CONFIRMED")
                            .font(.system(size: 9).bold())
                            .foregroundColor(.secondaryText)
                        
                        Text(countryData.latestConfirmed.displayString)
                            .font(.title3.bold())
                            .redacted(reason: entry.isPreview ? .placeholder : [])
                    }
                }
            } else {
                NoDataView()
            }
        }
        .widgetURL(entry.countryData?.deeplinkURL)
        .padding()
    }
}

// MARK: - Previews 📷

struct SingleCountryCovidConfirmedView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            SingleCountryCovidConfirmedView(entry: .placeholder)
            SingleCountryCovidConfirmedView(entry: .template)
            SingleCountryCovidConfirmedView(entry: .templateEmpty)
        }
    }
    
    static var previews: some View {
        groupPreviews
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
