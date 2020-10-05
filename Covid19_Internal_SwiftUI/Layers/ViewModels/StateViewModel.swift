//
//  StateViewModel.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/29/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

class StateViewModel: Identifiable {
    let id = UUID()
    let data: IndiaHistory.DayWiseData.Region
    init(regionData: IndiaHistory.DayWiseData.Region) {
        self.data = regionData
    }
    var loc: String {
        return data.loc ?? ""
    }
    var confirmedCasesIndian: Int {
        return data.confirmedCasesIndian ?? 0
    }
    var confirmedCasesForeign: Int {
        return data.confirmedCasesForeign ?? 0
    }
    var discharged: Int {
        return data.discharged ?? 0
    }
    var deaths: Int {
        return data.deaths ?? 0
    }
    var totalConfirmed: Int {
        return data.totalConfirmed ?? 0
    }
    var active: Int {
        if let totalConfirmed = data.totalConfirmed,
            let toatlDischarged = data.discharged,
            let totalDeaths = data.deaths {
            return totalConfirmed - (toatlDischarged + totalDeaths)
        }
        return 0
    }
}
