//
//  Deeplink.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 02/05/22.
//

import Foundation

/// An `ObservableObject` which keep tracks of the current deeplink target.
/// We can observe any deeplinks inside our views by observing this object.
final class Deeplink: ObservableObject {
    @Published var target: DeeplinkResolver.Target?
}
