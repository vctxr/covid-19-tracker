//
//  CountryCovidView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 24/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryCovidView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryCovidState, Never>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 16) {
                Text(viewStore.data.country)
                    .font(.title2.bold())
                    .foregroundColor(viewStore.style.countryTextColor)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("CONFIRMED")
                        .font(.caption.bold())
                        .foregroundColor(viewStore.style.confirmedTextColor)

                    Text("\(viewStore.data.latestConfirmed)")
                        .font(.headline.weight(.heavy))
                        .foregroundColor(viewStore.style.confirmedTextColor)
                }
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                    .foregroundColor(viewStore.style.confirmedTextColor)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .background(viewStore.style.backgroundColor)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
        }
    }
}

// MARK: - Previews 📷

struct CountryCovidView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CountryCovidView(
                store: Store(
                    initialState: .templateFirst,
                    reducer: .noop,
                    environment: ()
                )
            )
            .previewLayout(.sizeThatFits)
            
            CountryCovidView(
                store: Store(
                    initialState: .templateSecond,
                    reducer: .noop,
                    environment: ()
                )
            )
            .previewLayout(.sizeThatFits)
            
            CountryCovidView(
                store: Store(
                    initialState: .templateThird,
                    reducer: .noop,
                    environment: ()
                )
            )
            .previewLayout(.sizeThatFits)
            
            CountryCovidView(
                store: Store(
                    initialState: .templateNormal,
                    reducer: .noop,
                    environment: ()
                )
            )
            .previewLayout(.sizeThatFits)
        }
    }
    
    static var previews: some View {
        groupPreviews
            .redacted(reason: .placeholder)
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
