//
//  MultipleCountryCovidConfirmedView.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import SwiftUI
import WidgetKit

struct MultipleCountryCovidConfirmedView: View {
    // MARK: - Variables 📦
        
    let entry: MultipleCountryIntentTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        VStack(spacing: 0) {
            if entry.countriesData.isEmpty {
                NoDataView()
            } else {
                countryListView
            }
            
            DateView(date: entry.date)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
    
    private var countryListView: some View {
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
}

// MARK: - Previews 📷

struct CovidConfirmedView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            MultipleCountryCovidConfirmedView(entry: .placeholder)
            MultipleCountryCovidConfirmedView(entry: .template)
            MultipleCountryCovidConfirmedView(entry: .templateEmpty)
        }
    }
    
    static var previews: some View {
        groupPreviews
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
