//
//  DistrictModel.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/24/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct District: Decodable {
    var districtData: [String: CovidCount]?
    var stateCode: String?
    struct CovidCount: Decodable {
        var notes: String?
        var active: Int?
        var confirmed: Int?
        var deceased: Int?
        var recovered: Int?
        var delta: Delta?
        struct Delta: Decodable {
            var confirmed: Int?
              var deceased: Int?
              var recovered: Int?
        }
    }
    enum CodingKeys: String, CodingKey {
            case stateCode = "statecode"
            case districtData
        }
}
