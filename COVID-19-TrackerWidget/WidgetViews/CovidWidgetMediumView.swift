//
//  CovidWidgetMediumView.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import SwiftUI
import WidgetKit
import ColorPalette

struct CovidWidgetMediumView: View {
    // MARK: - Variables 📦
    
    var entry: CovidTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(entry.countriesData) { data in
                VStack(spacing: 0) {
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
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .padding(.vertical, 4)
                    
                    if data.id != entry.countriesData.last?.id {
                       Divider()
                    }
                }
            }
            
            HStack(spacing: 0) {
                Spacer()
                Text(entry.date, style: .date)
                Spacer()
            }
            .font(.system(size: 9).bold())
            .foregroundColor(.secondaryText)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

// MARK: - Previews 📷

struct CovidWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        CovidWidgetMediumView(entry: .placeholder)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
