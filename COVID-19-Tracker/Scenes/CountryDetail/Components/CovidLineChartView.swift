//
//  CovidLineChartView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI
import Charts
import SharedDateFormatter
import ColorPalette

struct CovidLineChartView: UIViewRepresentable {
    // MARK: - Variables 📦
    
    var entries: [CovidChartEntry]
    var mode: ChartMode
    var id: String
    
    @Binding var highlightedEntry: CovidChartEntry?
    
    private let formatter = SharedDateFormatter.shared.formatter(withFormat: "yyyy-MM-dd")
    
    private var cacheKey: String { "\(id)-\(mode.titleText)" }
    
    // MARK: - Methods ⛓
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.legend.enabled = false
        chart.setScaleEnabled(false)
        chart.delegate = context.coordinator
        let panGesture = chart.gestureRecognizers?.first(where: { $0 is UIPanGestureRecognizer })
        panGesture?.delegate = context.coordinator
        
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
        
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        // Hide highlight if it is nil.
        if highlightedEntry == nil {
            uiView.highlightValue(nil)
        }
        
        let (dataSet, isFromCache) = generateChartDataSet(withContext: context)
        uiView.data = LineChartData(dataSet: dataSet)
        uiView.notifyDataSetChanged()

        guard !isFromCache else { return }
        uiView.animate(xAxisDuration: 1.25, easingOption: .easeOutSine)
    }
    
    // MARK: - Private Methods 🔒
    
    private func generateChartDataSet(withContext context: Context) -> (dataSet: LineChartDataSet, isFromCache: Bool) {
        // Use cache for better performance.
        if let cachedDataSet = context.coordinator.cachedDataSets[cacheKey] {
            return (dataSet: cachedDataSet, isFromCache: true)
        }
        
        let chartDataEntries = entries.compactMap { data -> ChartDataEntry? in
            guard let date = formatter.date(from: data.dateString) else { return nil }
            return ChartDataEntry(x: date.timeIntervalSince1970, y: Double(data.value))
        }
        
        let dataSet = LineChartDataSet(entries: chartDataEntries)
        dataSet.drawCirclesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        dataSet.setColor(.red)
        dataSet.lineWidth = 3
        dataSet.lineCapType = .round
        dataSet.highlightColor = UIColor(Color.secondaryText)
        
        let gradientColors = [
            Color.red900Color.opacity(0.2).cgColor,
            Color.red900Color.cgColor
        ]
        
        let gradient = CGGradient(
            colorsSpace: nil,
            colors: gradientColors as CFArray,
            locations: nil
        )!
        
        dataSet.fill = .fillWithLinearGradient(gradient, angle: 90)
        dataSet.drawFilledEnabled = true
        
        context.coordinator.cachedDataSets[cacheKey] = dataSet
        
        return (dataSet: dataSet, isFromCache: false)
    }
}

// MARK: - Coordinator

extension CovidLineChartView {
    class Coordinator: NSObject, ChartViewDelegate, UIGestureRecognizerDelegate {
        var parent: CovidLineChartView
        var cachedDataSets: [String: LineChartDataSet] = [:]
        
        private let formatter = SharedDateFormatter.shared.formatter(withFormat: "dd-MM-yyyy")
        
        init(_ lineChartView: CovidLineChartView) {
            parent = lineChartView
        }
        
        // MARK: - ChartViewDelegate
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let date = Date(timeIntervalSince1970: entry.x)
            let dateString = formatter.string(from: date)
            parent.highlightedEntry = CovidChartEntry(dateString: dateString, value: Int(entry.y))
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            parent.highlightedEntry = nil
        }
        
        // MARK: - UIGestureRecognizerDelegate
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            // Prevents any parent scrolling when panning the chart view.
            if otherGestureRecognizer.view is UIScrollView {
                return false
            } else {
                return true
            }
        }
    }
}
