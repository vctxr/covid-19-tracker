//
//  Number+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

import Foundation

extension Numeric {
    var displayString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ","
        
        guard let nsNumber = self as? NSNumber else { return "-" }
        return formatter.string(from: nsNumber) ?? "-"
    }
}
