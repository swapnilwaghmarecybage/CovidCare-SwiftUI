//
//  IndiaHistoryModel.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/23/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct IndiaHistory: Decodable {
    var success: Bool
    var data: [DayWiseData]?
    var lastRefreshed: String?
    var lastOriginUpdate: String?
    struct DayWiseData: Decodable {
        var day: String?
        var summary: SummaryAllIndia?
        var regional: [Region]?
        struct SummaryAllIndia: Decodable {
            var total: Int?
            var confirmedCasesIndian: Int?
            var confirmedCasesForeign: Int?
            var discharged: Int?
            var deaths: Int?
            var confirmedButLocationUnidentified: Int?
            func active () -> Int? {
                if let total = total,
                   let discharged = discharged, let deaths = deaths {
                    return total - (discharged + deaths)
                }
                return nil
            }
        }
        struct Region: Decodable {
            var loc: String?
            var confirmedCasesIndian: Int?
            var confirmedCasesForeign: Int?
            var discharged: Int?
            var deaths: Int?
            var totalConfirmed: Int?
            func active () -> Int? {
                if let total = totalConfirmed, let discharged = discharged, let deaths = deaths {
                    return total - (discharged + deaths)
                }
                return nil
            }
        }
    }
}
