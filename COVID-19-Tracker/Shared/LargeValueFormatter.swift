//
//  LargeValueFormatter.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import Charts

/// Copied from the `Charts` repository demo.
class LargeValueFormatter: IValueFormatter, IAxisValueFormatter {
    // MARK: - Variables 📦
    
    /// Suffix to be appended after the values.
    public var suffix = ["", "K", "M", "B", "T"]
    
    /// An appendix text to be added at the end of the formatted value.
    public var appendix: String?
    
    // MARK: - Inits 🐣
    
    public init(appendix: String? = nil) {
        self.appendix = appendix
    }
    
    // MARK: - Methods ⛓
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        format(value: value)
    }
    
    public func stringForValue(
        _ value: Double,
        entry: ChartDataEntry,
        dataSetIndex: Int,
        viewPortHandler: ViewPortHandler?
    ) -> String {
        format(value: value)
    }
    
    // MARK: - Private Methods 🔒
    
    private func format(value: Double) -> String {
        var sig = value
        var length = 0
        let maxLength = suffix.count - 1
        
        while sig >= 1000.0 && length < maxLength {
            sig /= 1000.0
            length += 1
        }
        
        var r = String(format: "%2.f", sig) + suffix[length]
        
        if let appendix = appendix {
            r += appendix
        }
        
        return r
    }
}
