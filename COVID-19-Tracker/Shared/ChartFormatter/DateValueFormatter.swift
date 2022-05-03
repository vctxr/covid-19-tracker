//
//  DateValueFormatter.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import Foundation
import Charts
import SharedDateFormatter

/// Copied from the `Charts` repository demo.
/// This class is used to format the chart axis to a specified date format.
final class DateValueFormatter: IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        SharedDateFormatter.shared.formatter(withFormat: "dd-MM-yyyy")
            .string(from: Date(timeIntervalSince1970: value))
    }
}
