//
//  Deeplink.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

final class Deeplink: ObservableObject {
    @Published var target: DeeplinkResolver.Target?
}
