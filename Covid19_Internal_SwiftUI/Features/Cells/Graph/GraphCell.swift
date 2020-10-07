//
//  GraphCell.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/28/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct GraphCell: View {
    var chartDataType: Any
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    private var heightOfContainer: CGFloat = 250

    init(chartDataType: Any) {
        self.chartDataType = chartDataType
        UITableViewCell.appearance().backgroundColor = .clear

    }
    var body: some View {
        Group {
            VStack {
                if let pieData = self.chartDataType as? PieChartDataType {
                    PieChartContainer(data: pieData)
                } else if let barData = self.chartDataType as? BarGraphDataType {
                    BarChartContainer(data: barData)
                }
            }.frame(width: screenWidth - 50, height: heightOfContainer)
                .background(Color(Theme.highlightedColor))
                .position(x: (UIScreen.main.bounds.width/2)-25, y: heightOfContainer/2)
                .background(Color(Theme.highlightedColor))
                .cornerRadius(10)
                .padding(.top, CGFloat(5))
                .padding(.bottom, CGFloat(5))
        }.padding(.leading, CGFloat(10))
        .padding(.trailing, CGFloat(10))
        .listRowBackground(Color(Theme.backgroundColor))
    }
}
