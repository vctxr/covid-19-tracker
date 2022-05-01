//
//  CovidEntryLegendView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI

// MARK: - State

struct CovidEntryLegendState: Equatable {
    let entry: CovidEntry
    let valueKey: String
}

struct CovidEntryLegendView: View {
    // MARK: - Body 🎨
    
    let state: CovidEntryLegendState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Date: \(state.entry.dateString)")
                .font(.caption2)
                .foregroundColor(.secondaryText)
            Text("\(state.valueKey): \(state.entry.value.displayString)")
                .font(.caption2)
                .foregroundColor(.secondaryText)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 6)
        )
        .animation(.linear(duration: 0.1), value: state)
    }
}

// MARK: - Previews 📷

struct CovidEntryLegendView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CovidEntryLegendView(state: .template)
        }
        .previewLayout(.sizeThatFits)
    }

    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
