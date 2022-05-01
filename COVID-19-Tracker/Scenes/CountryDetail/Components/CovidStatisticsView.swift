//
//  CovidStatisticsView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import SwiftUI

struct CovidStatisticsView: View {
    // MARK: - Variables 📦
    
    let data: CovidCountryData
    
    // MARK: - Body 🎨
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(data.countryWithFlagText)
                    .font(.largeTitle.bold())
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text("Last updated:")
                    Text(data.latestUpdatedDateString)
                }
                .font(.caption)
                .foregroundColor(.secondaryText)
            }
            .padding(.bottom, 6)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(data.latestConfirmed.displayString)
                        .font(.title2.bold())
                        .foregroundStyle(
                            LinearGradient(
                                colors: .gradientOrange,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                    Text("Confirmed")
                        .font(.headline)
                        .foregroundColor(.secondaryText)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(data.latestDeaths.displayString)
                        .font(.title2.bold())
                    Spacer()
                    Text("Deaths")
                        .font(.headline)
                        .foregroundColor(.secondaryText)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(data.latestRecoveries.displayString)
                        .font(.title2.bold())
                    Spacer()
                    Text("Recoveries")
                        .font(.headline)
                        .foregroundColor(.secondaryText)
                }
            }
            .padding(.bottom, 4)
            
            HStack {
                Text("Source: systems.jhu.edu/research/public-health/ncov/")
                    .font(.caption2)
                    .foregroundColor(.secondaryText)
                Spacer()
            }
            .padding(.bottom, 16)
            
            VStack(spacing: 6) {
                Text(data.fatalityRatePercentageString)
                    .font(.title2.bold())
                    .foregroundColor(.redText)
                Text("Fatality rate")
                    .font(.headline)
                    .foregroundColor(.secondaryText)
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Previews 📷

struct CovidStatisticsView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CovidStatisticsView(data: .template)
                .previewLayout(.fixed(width: 414, height: 250))
        }
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
