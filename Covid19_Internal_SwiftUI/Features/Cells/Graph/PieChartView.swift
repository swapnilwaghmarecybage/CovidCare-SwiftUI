//
//  PieChartView.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/28/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PieChartContainer: View {
    private var data: PieChartDataType
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    init(data: PieChartDataType) {
        self.data = data
    }
    var body: some View {
        PieChart(containerFrame: CGRect(x: 0, y: 0, width: screenWidth - 50, height: 215), pieChartData: self.data)
    }
}
struct PieChart: UIViewRepresentable {
    var containerFrame: CGRect
    var pieChartData: PieChartDataType
    func makeUIView(context: Context) -> UIView {
        let chart = UIView(frame: containerFrame)
        chart.backgroundColor = UIColor.clear
        ChartsLayer.setPieChart(labels: pieChartData.labels,
                                values: pieChartData.values,
                                inputView: chart,
                                shouldShowPercentage: pieChartData.shouldShowPercentage)
        return chart
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
