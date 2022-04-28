//
//  CountryListEmptyView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import SwiftUI

struct CountryListEmptyView: View {
    // MARK: - Body 🎨
    
    var body: some View {
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
}

// MARK: - Previews 📷

struct CountryListEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryListEmptyView()
                .preferredColorScheme(.light)
            CountryListEmptyView()
                .preferredColorScheme(.dark)
        }
    }
}
