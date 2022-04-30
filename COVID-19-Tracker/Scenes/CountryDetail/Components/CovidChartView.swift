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
                .padding(.bottom, 16)
                
                Text("COVID-19 \(viewStore.selectedChart.titleText)")
                    .font(.subheadline)
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, -8)
                
                ZStack(alignment: .topLeading) {
                    LineChartViewRepresentable(
                        data: viewStore.chartData,
                        highlightedEntry: viewStore.binding(
                            get: \.entryLegendState?.entry,
                            send: CountryDetailAction.onHighlightedEntryChanged
                        )
                    )
                    .frame(maxHeight: 500)
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                    
                    IfLetStore(store.scope(state: \.entryLegendState).actionless) { store in
                        CovidEntryLegendView(store: store)
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
