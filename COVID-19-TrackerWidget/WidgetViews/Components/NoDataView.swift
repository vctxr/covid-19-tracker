//
//  NoDataView.swift
//  COVID-19-TrackerWidgetExtension
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import SwiftUI
import WidgetKit

struct NoDataView: View {
    // MARK: - Body 🎨
    
    var body: some View {
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

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
