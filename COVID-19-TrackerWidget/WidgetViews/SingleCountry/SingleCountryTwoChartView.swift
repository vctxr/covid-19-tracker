//
//  SingleCountryTwoChartView.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import SwiftUI
import WidgetKit
import LightChart

struct SingleCountryTwoChartView: View {
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
                    DateView(date: entry.date)
                }
                
                HStack(spacing: 16) {
                    VStack(alignment: .trailing) {
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
                            currentValueLineType: .dash(
                                color: .gray,
                                lineWidth: 1,
                                dash: [5]
                            )
                        )
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("CONFIRMED")
                                .font(.system(size: 9).bold())
                                .foregroundColor(.secondaryText)
                            
                            Text(countryData.latestConfirmed.displayString)
                                .font(.title3.bold())
                                .redacted(reason: entry.isPreview ? .placeholder : [])
                        }
                    }
                    
                    VStack(alignment: .trailing) {
                        LightChartView(
                            data: countryData.timeseriesData.map { Double($0.active) },
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
                            currentValueLineType: .dash(
                                color: .gray,
                                lineWidth: 1,
                                dash: [5]
                            )
                        )
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("ACTIVE")
                                .font(.system(size: 9).bold())
                                .foregroundColor(.secondaryText)
                            
                            Text(countryData.latestActive.displayString)
                                .font(.title3.bold())
                                .redacted(reason: entry.isPreview ? .placeholder : [])
                        }
                    }
                }
                
            } else {
                NoDataView()
            }
        }
        .padding()
    }
}

// MARK: - Previews 📷

struct SingleCountryTwoChartView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCountryTwoChartView(entry: .template)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
