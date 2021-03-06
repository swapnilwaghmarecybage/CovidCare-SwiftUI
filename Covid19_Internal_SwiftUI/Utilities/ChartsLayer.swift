//
//  ChartsLayer.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghmare on 6/25/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import UIKit
import Charts

struct ChartsLayer {
    static func setPieChart(labels: [String], values: [Double],
                            inputView: UIView, shouldShowPercentage: Bool) {
        if inputView.subviews.count == 0 {
            var entries = [PieChartDataEntry]()
            for (index, value) in values.enumerated() {
                let entry = PieChartDataEntry()
                entry.y = value
                entry.label = labels[index]
                entries.append( entry)
            }
            let set = PieChartDataSet( entries: entries, label: "Pie Chart")
            let colorsArray = [CaseType.active.color, CaseType.recovered.color, CaseType.deceased.color]
            set.colors = colorsArray
            let data = PieChartData(dataSet: set)
            let chart = PieChartView(frame: inputView.frame)
            chart.noDataText = "No data available"
            chart.isUserInteractionEnabled = true
            chart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0,
                          easingOptionX: .easeInCirc, easingOptionY: .easeInCirc)
            if shouldShowPercentage {
                chart.usePercentValuesEnabled = true
                let pFormatter = NumberFormatter()
                pFormatter.numberStyle = .percent
                pFormatter.maximumFractionDigits = 1
                pFormatter.multiplier = 1
                data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
                chart.chartDescription?.enabled = true
            } else {
                chart.chartDescription?.enabled = false
            }
            chart.data = data
            chart.legend.textColor = Theme.labelColor
            chart.chartDescription?.textColor = Theme.labelColor
            chart.drawEntryLabelsEnabled = false
            chart.holeColor = UIColor.clear
            inputView.addSubview(chart)
            addConstraintsToInputViewOfPieChart(inputView: inputView, chart: chart)
        }
    }
    private static func addConstraintsToInputViewOfPieChart(inputView: UIView, chart: PieChartView) {
        chart.translatesAutoresizingMaskIntoConstraints = false
        inputView.addConstraint(NSLayoutConstraint(item: chart,
                                                   attribute: .trailing, relatedBy: .equal,
                                                   toItem: inputView, attribute: .trailing,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: chart,
                                                   attribute: .leading, relatedBy: .equal,
                                                   toItem: inputView, attribute: .leading,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: chart,
                                                   attribute: .top, relatedBy: .equal,
                                                   toItem: inputView, attribute: .top,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: chart,
                                                   attribute: .bottom, relatedBy: .equal,
                                                   toItem: inputView, attribute: .bottom,
                                                   multiplier: 1, constant: 0))
    }
    static func setBarChart(labels: [String], values: [Double],
                            inputView: UIView, caseType: CaseType, barTag: Int) {
        if values.count == 0 || labels.count == 0 { return }
        var shouldDrawChart = false
        if inputView.subviews.count > 0 {
            for subView in inputView.subviews where subView.tag != barTag {
                    subView.removeFromSuperview()
                    shouldDrawChart = true
            }
        } else {
            shouldDrawChart = true
        }
        if !shouldDrawChart { return }
        var dataEntries: [BarChartDataEntry] = []
        for index in 0..<values.count {
            let dataEntry =  BarChartDataEntry(x: Double(index), y: values[index])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries)
        chartDataSet.valueColors = [Theme.labelColor]
        let chartData = BarChartData(dataSet: chartDataSet)
        let barChartView = BarChartView(frame: inputView.frame)
        barChartView.tag = barTag
        barChartView.data = chartData
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        barChartView.legend.enabled = false
        barChartView.chartDescription?.enabled = false
        barChartView.frame.origin = CGPoint.zero
        barChartView.frame.size = CGSize(width: inputView.frame.size.width, height: inputView.frame.size.height - 25)
        chartDataSet.colors = [caseType.color]
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.axisLineColor = Theme.labelColor
        barChartView.leftAxis.axisLineColor = Theme.labelColor
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.labelTextColor = Theme.labelColor
        barChartView.leftAxis.labelTextColor = Theme.labelColor
        barChartView.xAxis.labelRotationAngle = -90
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.setVisibleXRangeMinimum(6)
        inputView.addSubview(barChartView)
        addConstraintsToInputViewBarCahrt(inputView: inputView, barChartView: barChartView)
         }
    private static func addConstraintsToInputViewBarCahrt(inputView: UIView, barChartView: BarChartView) {
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        inputView.addConstraint(NSLayoutConstraint(item: barChartView,
                                                   attribute: .trailing, relatedBy: .equal,
                                                   toItem: inputView, attribute: .trailing,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: barChartView,
                                                   attribute: .leading, relatedBy: .equal,
                                                   toItem: inputView, attribute: .leading,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: barChartView,
                                                   attribute: .top, relatedBy: .equal,
                                                   toItem: inputView, attribute: .top,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: barChartView,
                                                   attribute: .bottom, relatedBy: .equal,
                                                   toItem: inputView, attribute: .bottom,
                                                   multiplier: 1, constant: 0))

    }
    static func setLineChart(labels: [String], values: [Double], inputView: UIView) {
        var dataEntries: [ChartDataEntry] = []
        for index in 0..<values.count {
            let dataEntry =  ChartDataEntry(x: Double(index), y: values[index])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries)
        let chartData = LineChartData(dataSet: chartDataSet)
        let lineChartView = LineChartView(frame: inputView.frame)
        lineChartView.data = chartData
        lineChartView.legend.enabled = false
        lineChartView.chartDescription?.enabled = false
        lineChartView.frame.origin = CGPoint.zero
        lineChartView.frame.size = inputView.frame.size
        chartDataSet.colors = [UIColor(red: 205/255, green: 92/255, blue: 92/255, alpha: 1.0)]
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        inputView.subviews.forEach { $0.removeFromSuperview() }
        inputView.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        inputView.addConstraint(NSLayoutConstraint(item: lineChartView,
                                                   attribute: .trailing, relatedBy: .equal,
                                                   toItem: inputView, attribute: .trailing,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: lineChartView,
                                                   attribute: .leading, relatedBy: .equal,
                                                   toItem: inputView, attribute: .leading,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: lineChartView,
                                                   attribute: .top, relatedBy: .equal,
                                                   toItem: inputView, attribute: .top,
                                                   multiplier: 1, constant: 0))
        inputView.addConstraint(NSLayoutConstraint(item: lineChartView,
                                                   attribute: .bottom, relatedBy: .equal,
                                                   toItem: inputView, attribute: .bottom,
                                                   multiplier: 1, constant: 0))
    }
}
