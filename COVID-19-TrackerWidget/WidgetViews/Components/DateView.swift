//
//  DateView.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import SwiftUI
import WidgetKit

struct DateView: View {
    // MARK: - Variables 📦
    
    let date: Date
    
    // MARK: - Body 🎨
    
    var body: some View {
        HStack(spacing: 0) {
            Text(date, style: .date)
            Text(date, style: .time)
                .padding(.leading, 8)
        }
        .font(.system(size: 9).bold())
        .foregroundColor(.secondaryText)
    }
}

// MARK: - Previews 📷

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: Date())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
