//
//  WorldViewModel.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 9/16/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

class WorldViewModel: Identifiable {
    let id = UUID()
    let arrayCountries: [Country]
    init(object: [Country]) {
        self.arrayCountries = object
    }
    var totalCases: Int {
        return arrayCountries.compactMap({$0.cases}).reduce(0, +) }
    var totalRecovered: Int {
        return arrayCountries.compactMap({$0.recovered}).reduce(0, +) }
    var totalDeaths: Int {
        return arrayCountries.compactMap({$0.deaths}).reduce(0, +) }
    var name: String {
        return "Worlds"
    }
    var totalActive: Int {
        return arrayCountries.compactMap({$0.active}).reduce(0, +) }
    var newCases: Int {
        return arrayCountries.compactMap({$0.todayCases}).reduce(0, +) }
    var newRecovered: Int {
        return arrayCountries.compactMap({$0.todayRecovered}).reduce(0, +) }
    var newDeaths: Int {
        return arrayCountries.compactMap({$0.todayDeaths}).reduce(0, +) }
    var critical: Int {
        return arrayCountries.compactMap({$0.critical}).reduce(0, +) }
    var tests: Int {
        return arrayCountries.compactMap({$0.tests}).reduce(0, +) }
}
