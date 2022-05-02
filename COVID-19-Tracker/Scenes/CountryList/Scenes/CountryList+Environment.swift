//
//  CountryList+Environment.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import CombineSchedulers
import ComposableArchitecture
import WidgetKit

struct CountryListEnvironment {
    let useCase: CountryListUseCase
    let mainQueue: AnySchedulerOf<DispatchQueue>
    let reloadWidgetCenter: () -> Effect<Never, Never>
}

extension CountryListEnvironment {
    static var live: CountryListEnvironment {
        CountryListEnvironment(
            useCase: CountryListUseCase(),
            mainQueue: .main,
            reloadWidgetCenter: {
                .fireAndForget {
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        )
    }
}
