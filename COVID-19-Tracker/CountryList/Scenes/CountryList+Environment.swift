//
//  CountryList+Environment.swift
//  COVID-19 Tracker
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import CombineSchedulers

struct CountryListEnvironment {
    let useCase: CountryListUseCase
    let mainQueue: AnySchedulerOf<DispatchQueue>
}

extension CountryListEnvironment {
    static var live: CountryListEnvironment {
        CountryListEnvironment(
            useCase: CountryListUseCase(),
            mainQueue: .main
        )
    }
}
