//
//  TypeAlises.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghmare on 05/10/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

typealias BarGraphDataType = (labels: [String], valuesOfTotalConfirmed: [Double],
                        valueOfTotalActive: [Double], valueOfTotalRecovered: [Double],
                        valueOfTotalDeaths: [Double])

typealias PieChartDataType = (labels: [String], values: [Double], shouldShowPercentage: Bool)
typealias DosAndDonts = (title: String, imageName: String, description: String)
