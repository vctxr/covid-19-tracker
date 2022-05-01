//
//  CovidWidgetMediumView.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import SwiftUI
import WidgetKit

struct CovidWidgetMediumView: View {
    // MARK: - Variables 📦
    
    var entry: CovidTimelineProvider.Entry

    // MARK: - Body 🎨
    
    var body: some View {
        HStack {
            Text(entry.timeseriesData[0].countryName)
        }
    }
}

// MARK: - Previews 📷

struct CovidWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        CovidWidgetMediumView(entry: .placeholder)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
