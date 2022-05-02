//
//  URL+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

extension URL {
    subscript(queryParam param: String) -> String? {
        guard let components = URLComponents(string: absoluteString) else { return nil }
        return components.queryItems?.first(where: { $0.name == param })?.value
    }
}
