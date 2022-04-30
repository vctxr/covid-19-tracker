//
//  CovidLineChartViewRepresentable.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import Foundation
import SwiftUI
import Charts
import SharedDateFormatter

struct LineChartViewRepresentable: UIViewRepresentable {
    // MARK: - Variables 📦
    
    var data: [CovidDayData]
    @Binding var highlightedEntry: CovidEntry?
    
    // MARK: - Methods ⛓
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.legend.enabled = false
        chart.setScaleEnabled(false)
        chart.animate(xAxisDuration: 1.25, easingOption: .easeOutSine)
        chart.delegate = context.coordinator
        
        let xAxis = chart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.setLabelCount(3, force: true)
        xAxis.avoidFirstLastClippingEnabled = true
        xAxis.valueFormatter = DateValueFormatter()
        
        let leftAxis = chart.leftAxis
        leftAxis.drawGridLinesEnabled = false
        leftAxis.enabled = false
        
        let rightAxis = chart.rightAxis
        rightAxis.drawGridLinesEnabled = false
        rightAxis.valueFormatter = LargeValueFormatter()
        
        chart.data = LineChartData(dataSet: generateChartDataSet())

        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {}
    
    // MARK: - Private Methods 🔒
    
    private func generateChartDataSet() -> LineChartDataSet {
        let formatter = SharedDateFormatter.shared.formatter(withFormat: "yyyy-MM-dd")

        let chartDataEntries: [ChartDataEntry] = data.compactMap { data in
            guard let date = formatter.date(from: data.dateString) else { return nil }
            return ChartDataEntry(x: Double(date.timeIntervalSince1970),
                                  y: Double(data.confirmed))
        }
        
        let dataSet = LineChartDataSet(entries: chartDataEntries)
        dataSet.drawCirclesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        dataSet.setColor(.red)
        dataSet.lineWidth = 3
        dataSet.lineCapType = .round
        dataSet.highlightColor = UIColor(Color.secondaryText)
        
        let gradientColors = [
            Color.red900Color.opacity(0.1).cgColor,
            Color.red900Color.cgColor
        ]
        
        let gradient = CGGradient(
            colorsSpace: nil,
            colors: gradientColors as CFArray,
            locations: nil
        )!
        
        dataSet.fill = .fillWithLinearGradient(gradient, angle: 90)
        dataSet.drawFilledEnabled = true
        
        return dataSet
    }
}

// MARK: - Coordinator

extension LineChartViewRepresentable {
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: LineChartViewRepresentable
        
        init(_ lineChartView: LineChartViewRepresentable) {
            parent = lineChartView
        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            parent.highlightedEntry = CovidEntry(date: entry.x, value: entry.y)
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            parent.highlightedEntry = nil
        }
    }
}
