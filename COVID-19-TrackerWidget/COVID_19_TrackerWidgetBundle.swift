//
//  COVID_19_TrackerWidgetBundle.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 05/05/22.
//

import WidgetKit
import SwiftUI

@main
struct COVID_19_TrackerWidgetBundle: WidgetBundle {
    var body: some Widget {
        SingleCountryWidget()
        MultipleCountryWidget()
    }
}
