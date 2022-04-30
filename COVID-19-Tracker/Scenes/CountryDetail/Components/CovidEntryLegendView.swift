//
//  CovidEntryLegendView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI
import ComposableArchitecture
import SharedDateFormatter

// MARK: - State

struct CovidEntryLegendState: Equatable {
    let entry: CovidEntry
    let valueKey: String
    
    var dateString: String {
        let date = Date(timeIntervalSince1970: entry.date)
        let formatter = SharedDateFormatter.shared.formatter(withFormat: "dd-MM-yyyy")
        return formatter.string(from: date)
    }
}

struct CovidEntryLegendView: View {
    // MARK: - Body 🎨
    
    let store: Store<CovidEntryLegendState, Never>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading, spacing: 2) {
                Text("Date: \(viewStore.dateString)")
                    .font(.caption2)
                    .foregroundColor(.secondaryText)
                Text("\(viewStore.valueKey): \(viewStore.entry.value.displayString)")
                    .font(.caption2)
                    .foregroundColor(.secondaryText)
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 8)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 6)
            )
            .animation(.default, value: viewStore.entry.value)
        }
    }
}

// MARK: - Previews 📷

struct CovidEntryLegendView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CovidEntryLegendView(
                store: Store(
                    initialState: .template,
                    reducer: .empty,
                    environment: ()
                )
            )
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
