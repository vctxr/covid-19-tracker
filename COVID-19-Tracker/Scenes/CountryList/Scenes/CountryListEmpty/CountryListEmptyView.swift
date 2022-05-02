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
        Text("No results found.\nTry searching for another country.")
            .multilineTextAlignment(.center)
            .font(.title2)
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
