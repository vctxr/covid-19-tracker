//
//  CovidInformationView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CovidInformationView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryDetailState, CountryDetailAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(
            """
            The first case of the new Coronavirus COVID-19 was recorded on 31 December in Wuhan, Chine (WHO). Since then, more that 500,000 confirmed cases have been recorded worldwide.
            
            Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment. Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.
            """
                )
                .foregroundColor(.secondaryText)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .layoutPriority(1)
                
                Button {
                    viewStore.send(.setSafariView(isPresented: true))
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
            }
        }
    }
}

// MARK: - Previews 📷

struct CovidInformationView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            CovidInformationView(
                store: Store(
                    initialState: .template,
                    reducer: .empty,
                    environment: ()
                )
            )
            .previewLayout(.sizeThatFits)
        }
    }
    
    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
