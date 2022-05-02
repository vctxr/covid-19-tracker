//
//  CovidWidgetMediumView.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import SwiftUI
import WidgetKit
import ColorPalette

struct CovidConfirmedRankingView: View {
    // MARK: - Variables 📦
    
    let entry: CovidTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if entry.countriesData.isEmpty {
                noDataView
            } else {
                countryListView
            }
            
            dateView
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
    
    var countryListView: some View {
        ForEach(entry.countriesData) { data in
            if let deeplinkURL = data.deeplinkURL {
                VStack(spacing: 0) {
                    Link(destination: deeplinkURL) {
                        HStack {
                            Text(data.countryWithFlagText)
                                .font(.headline.bold())
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 2) {
                                Text("CONFIRMED")
                                    .font(.system(size: 9).bold())
                                    .foregroundColor(.secondaryText)
                                
                                Text(data.latestConfirmed.displayString)
                                    .font(.subheadline.bold())
                                    .redacted(reason: entry.isPreview ? .placeholder : [])
                            }
                            .frame(maxHeight: .infinity)
                        }
                        .padding(.vertical, 4)
                    }
                    
                    if data.id != entry.countriesData.last?.id {
                       Divider()
                    }
                }
            }
        }
    }
    
    var dateView: some View {
        HStack(spacing: 0) {
            Spacer()
            Text(entry.date, style: .date)
            Text(entry.date, style: .time)
                .padding(.leading, 8)
            Spacer()
        }
        .font(.system(size: 9).bold())
        .foregroundColor(.secondaryText)
    }
    
    var noDataView: some View {
        Text("No Data.\nTry opening the app to reload.")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .font(.title3)
            .foregroundStyle(
                LinearGradient(
                    colors: .gradientPurple,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

// MARK: - Previews 📷

struct CovidWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CovidConfirmedRankingView(entry: .placeholder)
            CovidConfirmedRankingView(entry: .template)
            CovidConfirmedRankingView(entry: .templateEmpty)
        }
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
