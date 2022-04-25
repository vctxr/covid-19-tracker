//
//  CountryListContentView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListContentView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryListContentState, CountryListContentAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        SwitchStore(store.scope(state: \.contentState)) {
            CaseLet(state: /CountryListContentState.ContentState.empty,
                    action: CountryListContentAction.empty) { _ in
                Text("No Results.\nSearch for another country.")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(hex: "F06744"),
                                Color(hex: "EE4C53"),
                                Color(hex: "D35E94"),
                                Color(hex: "9C6CA5"),
                                Color(hex: "6782BE"),
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }

            CaseLet(state: /CountryListContentState.ContentState.available,
                    action: CountryListContentAction.available) { availableStore in
                CountryListAvailableView(store: availableStore)
            }
        }
    }
}

// MARK: - Previews 📷

struct CountryListLoadedView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListContentView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: .empty,
                    environment: ()
                )
            )
            .redacted(reason: .placeholder)

            CountryListContentView(
                store: Store(
                    initialState: .templateAvailable,
                    reducer: .empty,
                    environment: ()
                )
            )
            
            CountryListContentView(
                store: Store(
                    initialState: .templateEmpty,
                    reducer: .empty,
                    environment: ()
                )
            )
        }
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
