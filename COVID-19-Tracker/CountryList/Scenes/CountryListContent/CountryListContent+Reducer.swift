//
//  CountryListContent+Reducer.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import IdentifiedCollections
import CasePaths

// MARK: - State

struct CountryListContentState: Equatable {
    private var _contentState: ContentState
    var contentState: ContentState {
        get {
            if _contentState.availableState?.countryCovidStates.isEmpty == true {
                return .empty
            } else {
                return _contentState
            }
        }
        set {
            _contentState = newValue
        }
    }

    enum ContentState: Equatable {
        case empty
        case available(state: CountryListAvailableState)
        
        var availableState: CountryListAvailableState? {
            get { (/ContentState.available).extract(from: self) }
            set {
                guard let countryListAvailableState = newValue else { return }
                self = .available(state: countryListAvailableState)
            }
        }
    }
    
    // MARK: - Inits 🐣
    
    init(timeseriesData: [CountryCovidTimeseries], searchText: String, sortType: SortType) {
        _contentState = timeseriesData.isEmpty ?
            .empty :
            .available(
                state: CountryListAvailableState(
                    timeseriesData: timeseriesData,
                    searchText: searchText
                )
            )
    }
}

// MARK: - Action

enum CountryListContentAction: Equatable {    
    // Child actions.
    case empty(Never)
    case available(CountryListAvailableAction)
}
