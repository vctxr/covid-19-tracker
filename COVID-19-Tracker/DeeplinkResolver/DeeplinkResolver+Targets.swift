//
//  DeeplinkResolver+Targets.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

extension DeeplinkResolver {
    enum Target: Equatable {
        case root
        case countryDetail(id: String)
    }
}

extension DeeplinkResolver.Target {
    init(url: URL) {
        let target: DeeplinkResolver.Target
        
        switch url.host {
        case "":
            target = .root
        case "country-detail":
            guard let id = url[queryParam: "id"] else { target = .root; break }
            target = .countryDetail(id: id)
        default:
            target = .root
        }
        
        self = target
    }
}
