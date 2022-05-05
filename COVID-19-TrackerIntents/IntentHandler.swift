//
//  IntentHandler.swift
//  COVID-19-TrackerIntents
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension {
    private let dataStore = CovidCountriesDataStore()
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}

// MARK: - SelectSingleCountryIntentHandling

extension IntentHandler: SelectSingleCountryIntentHandling {
    func provideCountryOptionsCollection(for intent: SelectSingleCountryIntent, with completion: @escaping (INObjectCollection<Country>?, Error?) -> Void) {
        dataStore.loadData(.topFiftyConfirmed) { countriesData in
            if countriesData.isEmpty {
                completion(INObjectCollection(items: []), nil)
            } else {
                let countries = countriesData.map(Country.init(country:))
                let countriesCollection = INObjectCollection(items: countries)
                completion(countriesCollection, nil)
            }
        }
    }
}

// MARK: - SelectMultipleCountryIntentHandling

extension IntentHandler: SelectMultipleCountryIntentHandling {
    func provideCountriesOptionsCollection(for intent: SelectMultipleCountryIntent, with completion: @escaping (INObjectCollection<Country>?, Error?) -> Void) {
        switch intent.selectionType {
        case .unknown:
            completion(INObjectCollection(items: []), nil)
        case .topConfirmed:
            completion(INObjectCollection(items: []), nil)
        case .countries:
            dataStore.loadData(.topFiftyConfirmed) { countriesData in
                if countriesData.isEmpty {
                    completion(INObjectCollection(items: []), nil)
                } else {
                    let countries = countriesData.map(Country.init(country:))
                    let countriesCollection = INObjectCollection(items: [.none] + countries)
                    completion(countriesCollection, nil)
                }
            }
        }
    }
    
    func defaultCountries(for intent: SelectMultipleCountryIntent) -> [Country]? {
        (0...3).map { _ in Country.none }
    }
}
