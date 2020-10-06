//
//  CountryModel.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/16/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

struct CountryResponse: Decodable {
    let countryModels: [Country]
}

struct Country: Decodable {
    var updated: Int?
    var country: String?
    var cases: Int?
    var todayCases: Int?
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int?
    var todayRecovered: Int?
    var active: Int?
    var critical: Int?
    var casesPerOneMillion: Double?
    var deathsPerOneMillion: Double?
    var tests: Int?
    var testsPerOneMillion: Double?
    var population: Int?
    var continent: String?
    var oneCasePerPeople: Double?
    var oneDeathPerPeople: Double?
    var oneTestPerPeople: Double?
    var activePerOneMillion: Double?
    var recoveredPerOneMillion: Double?
    var criticalPerOneMillion: Double?
    var countryInfo: CountryInfo?
    struct CountryInfo: Decodable {
        var countryId: Int?
        var iso2: String?
        var iso3: String?
        var lat: Double?
        var long: Double?
        var flag: String?
        enum CodingKeys: String, CodingKey {
                case countryId = "_id"
                case iso2, iso3, lat, long, flag
            }
    }
}
