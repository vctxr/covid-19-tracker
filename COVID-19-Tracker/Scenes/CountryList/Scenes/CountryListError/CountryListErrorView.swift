//
//  CountryListErrorView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryListErrorView: View {
    // MARK: - Variables 📦
    
    let store: Store<Void, CountryListErrorAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 4) {
                Text("Something went wrong")
                    .font(.headline)
                Text("Have another go?")
                
                Button {
                    viewStore.send(.onTapRetry)
                } label: {
                    Label("Retry", systemImage: "arrow.clockwise")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Previews 📷

struct CountryListErrorView_Previews: PreviewProvider {
    static var groupPreviews: some View {
        Group {
            CountryListErrorView(
                store: Store(
                    initialState: (),
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
