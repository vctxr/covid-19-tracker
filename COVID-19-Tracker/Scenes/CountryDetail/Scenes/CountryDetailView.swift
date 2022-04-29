//
//  CountryDetailView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import SwiftUI
import ComposableArchitecture

struct CountryDetailView: View {
    // MARK: - Variables 📦
    
    let store: Store<CountryDetailState, CountryDetailAction>
    
    // MARK: - Body 🎨
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                VStack {
                    CovidStatisticsView(data: viewStore.data)
                        .padding(.bottom, 16)
                        .padding(.top, 300)
                    
                    CovidInformationView(store: store)
                        .padding(.bottom, 60)
                    
                    FootnoteView()
                }
            }
            .navigationTitle(viewStore.data.countryWithFlagText)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("COVID-19 Statistics")
                            .font(.headline)
                        Text("Regional Relative Time-series")
                            .font(.subheadline)
                    }
                }
            }
            .fullScreenCover(
                isPresented: viewStore.binding(
                    get: { $0.safariState != nil },
                    send: CountryDetailAction.setSafariView
                )
            ) {
                IfLetStore(
                    store.scope(state: \.safariState).actionless,
                    then: { safariStore in
                        SFSafariView(url: ViewStore(safariStore).state)
                        .edgesIgnoringSafeArea(.vertical)
                    }
                )
            }
        }
    }
}

// MARK: - Previews 📷

struct CountryDetailView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            NavigationView {
                CountryDetailView(
                    store: Store(
                        initialState: .template,
                        reducer: .empty,
                        environment: ()
                    )
                )
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
