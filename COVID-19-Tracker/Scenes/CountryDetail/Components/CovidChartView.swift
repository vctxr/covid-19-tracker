//
//  CovidChartView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CovidChartView: View {
    // MARK: - Body 🎨
    
    // Better performance when updating this value here rather than in the store.
    @State private var highlightedEntry: CovidChartEntry?
    
    let store: Store<CountryDetailState, CountryDetailAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Picker(
                    selection: viewStore.binding(
                        get: \.selectedChart,
                        send: CountryDetailAction.onSelectedChartChanged
                    )
                ) {
                    Text(ChartMode.confirmed.titleText)
                        .tag(ChartMode.confirmed)
                    Text(ChartMode.active.titleText)
                        .tag(ChartMode.active)
                } label: {}
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
                .onChange(of: viewStore.selectedChart) { selectedChart in
                    highlightedEntry = nil  // Hide highlighted entry when change chart.
                }
                .onChange(of: viewStore.chartEntries) { newValue in
                    highlightedEntry = nil  // Hide highlighted entry when entries changed.
                }
                
                Text("COVID-19 \(viewStore.selectedChart.titleText)")
                    .font(.subheadline)
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, -6)
                
                ZStack(alignment: .topLeading) {
                    CovidLineChartView(
                        entries: viewStore.chartEntries,
                        mode: viewStore.selectedChart,
                        id: viewStore.data.id,
                        highlightedEntry: $highlightedEntry
                    )
                    .frame(maxHeight: 500)
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                    
                    if let entry = highlightedEntry {
                        CovidEntryLegendView(
                            state: CovidEntryLegendState(
                                entry: entry,
                                valueKey: viewStore.selectedChart.legendText
                            )
                        )
                        .padding(16)
                    }
                }
            }
        }
    }
}

// MARK: - Previews 📷

struct CovidChartView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CovidChartView(
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
