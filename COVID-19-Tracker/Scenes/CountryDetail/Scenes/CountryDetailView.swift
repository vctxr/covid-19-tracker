//
//  CountryDetailView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import SwiftUI

struct CountryDetailView: View {
    // MARK: - Body 🎨
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    HStack {
                        Text("US")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Last updated:")
                            Text("2022-4-28")
                        }
                        .font(.caption)
                        .foregroundColor(.secondaryText)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 300)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("81,251,631")
                                .font(.title2.bold())
                                .foregroundColor(.orangeText)
                            Spacer()
                            Text("Confirmed")
                                .font(.subheadline)
                                .foregroundColor(.secondaryText)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("993,164")
                                .font(.title2.bold())
                            Spacer()
                            Text("Deaths")
                                .font(.subheadline)
                                .foregroundColor(.secondaryText)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("0")
                                .font(.title2.bold())
                            Spacer()
                            Text("Recoveries")
                                .font(.subheadline)
                                .foregroundColor(.secondaryText)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
                    
                    HStack {
                        Text("Source: systems.jhu.edu/research/public-health/ncov/")
                            .font(.caption2)
                            .foregroundColor(.secondaryText)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                    VStack {
                        Text("1.22%")
                            .font(.title2.bold())
                            .foregroundColor(.redText)
                        Text("Fatality rate")
                            .font(.subheadline)
                            .foregroundColor(.secondaryText)
                    }
                    .padding(.vertical, 16)
                    
                    Text(
                    """
                    The first case of the new Coronavirus COVID-19 was recorded on 31 December in Wuhan, Chine (WHO). Since then, more that 500,000 confirmed cases have been recorded worldwide.
                    
                    Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment. Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.
                    """
                    )
                    .foregroundColor(.secondaryText)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                    
                    Button {
                        
                    } label: {
                        Text("Learn more")
                            .font(.subheadline.weight(.medium))
                            .frame(maxWidth: .infinity)
                            .padding(5)
                    }
                    .tint(.primaryBlue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 100)
                    
                    Spacer()

                    VStack(alignment: .leading, spacing: 1) {
                        Text("PLEASE NOTE:")
                            .font(.system(size: 9, weight: .bold))
                        
                        Text("The datasets shown here were fetched from a JSON file made by github user pomber, which were provided by John Hopkins University Center for Systems Science and Engineering (JHU CSSE).")
                            .font(.system(size: 9))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(10)
                    .padding(
                        .bottom,
                        proxy.safeAreaInsets.bottom > 0 ?
                        proxy.safeAreaInsets.bottom : 10
                    )
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.grey900Color)
                    .offset(y: proxy.safeAreaInsets.bottom)
                }
                .frame(minHeight: proxy.size.height)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("COVID-19 Statistics").font(.headline)
                        Text("Regional Relative Time-series").font(.subheadline)
                    }
                }
            }
        }
    }
}

// MARK: - Previews 📷

struct CountryDetailView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            NavigationView {
                CountryDetailView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image(systemName: "chevron.left")
                                .font(.body.bold())
                                .foregroundColor(Color(uiColor: UIColor.link))
                        }
                    }
            }
        }
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
