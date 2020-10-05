//
//  HomeTabViewModel.swift
//  Covid19_Internal
//
//  Created by Swapnil Waghm on 6/15/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    @Published private var arrayCountries: [CountryViewModel] = [CountryViewModel]()
    @Published private var world: WorldViewModel?
    @Published private var india: CountryViewModel?
    @Published private var indiaHistory: IndiaHistory?
    @Published private var arrayStatesOfIndia: [StateViewModel] = [StateViewModel]()
    @Published var selectedSegmentIndex = 0
    private var district: [String: District]?

    init() {
        getCountriesData()
        getIndiaHistoricalData()
        getAllDistrictsData()
    }

    func getCountriesData() {
        CountriesWebService.fetchCountries { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let arrayCountries):
                    self.arrayCountries =  arrayCountries.map(CountryViewModel.init)
                    self.world = WorldViewModel(object: arrayCountries)
                    self.india = self.arrayCountries.filter({$0.countryName == "India"}).first
                case .failure:
                    print("FAILED")
                }
            }
        }
    }
    func getIndiaHistoricalData() {
        IndiaHistoricalDataWebServices.fetchIndiaHostoricalData { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let indiaHistoryModel):
                    self.indiaHistory = indiaHistoryModel
                    if let data = indiaHistoryModel.data {
                        if let date = indiaHistoryModel.lastRefreshed?
                            .components(separatedBy: "T").first,
                           let regions = data.filter({$0.day == date}).first?.regional {
                            self.arrayStatesOfIndia = regions.map(StateViewModel.init)
                        } else if let date = indiaHistoryModel.lastOriginUpdate?
                                    .components(separatedBy: "T").first, let regions = data
                                        .filter({$0.day == date}).first?.regional {
                            self.arrayStatesOfIndia = regions.map(StateViewModel.init)
                        } else {
                            if let regions = data.last?.regional {
                                self.arrayStatesOfIndia = regions.map(StateViewModel.init)
                            }
                        }
                        self.arrayStatesOfIndia = self.arrayStatesOfIndia
                            .sorted(by: {$0.totalConfirmed  > $1.totalConfirmed })
                    }
                case .failure:
                    print("FAILED")
                }
            }
        }
    }
    func getAllDistrictsData() {
        DistrictWebService.fetchDistricts { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let arrayDistricts):
                    self.district = arrayDistricts
                case .failure:
                    print("FAILED")
                }
            }
        }
    }
    func getWorldObjcect() -> WorldViewModel? {
        return self.world ?? nil
    }
    func getDataForWorldPieChart() -> PieChartDataType {
        if let world = self.world {
            let labels = [CaseType.active.name, CaseType.recovered.name, CaseType.deceased.name]
            let values = [Double(world.totalActive), Double(world.totalRecovered), Double(world.totalDeaths)]
            return (labels, values, true)
        }
        return ([], [], false)
    }
    func getCountries() -> [CountryViewModel] {
        return self.arrayCountries
    }
    func getCountriesCount() -> Int {
           return self.arrayCountries.count
       }
    func getIndiaObject() -> CountryViewModel? {
        return india ?? nil
    }
    func getStatesOfIndia() -> [StateViewModel] {
        return self.arrayStatesOfIndia
    }
    func getStatesCount() -> Int {
        return self.arrayStatesOfIndia.count
    }
    func getDataForIndiaBarChart() -> BarGraphDataType {
        let allDates = self.indiaHistory?.data?.compactMap({$0.day ?? ""  }) ?? []
       let allConfirmed = self.indiaHistory?.data?.compactMap({Double($0.summary?.total ?? 0)}) ?? []
       let allActive = self.indiaHistory?.data?.compactMap({Double($0.summary?.active() ?? 0)}) ?? []
        let allDeaths = self.indiaHistory?.data?.compactMap({Double($0.summary?.deaths ?? 0)}) ?? []
        let allRecovered = self.indiaHistory?.data?.compactMap({Double($0.summary?.discharged ?? 0)}) ?? []
        return (allDates, allConfirmed, allActive, allRecovered, allDeaths)
    }
    func getDataForStateHistoryBarChart(state: StateViewModel) -> BarGraphDataType {
        let allRegions = self.indiaHistory?.data?
            .compactMap({$0.regional?.compactMap({ (region: IndiaHistory.DayWiseData.Region)
                -> IndiaHistory.DayWiseData.Region? in
            if let location = region.loc,
               location.elementsEqual(state.loc) {
                return region
            }
            return nil
            })}).flatMap({$0})
        let allDays = self.indiaHistory?.data?.compactMap({ (object) -> String? in
            if let regions = object.regional, regions.contains(where: {$0.loc == state.loc}) == true {
                return object.day
            }
            return nil
        })
           let allConfirmed = allRegions?.compactMap({Double($0.totalConfirmed ?? 0)})
           let allActive = allRegions?.compactMap({Double($0.active() ?? 0)})
           let allDeaths = allRegions?.compactMap({Double($0.deaths ?? 0)})
           let allRecovered = allRegions?.compactMap({Double($0.discharged ?? 0)})

        return  (allDays ?? [], allConfirmed ?? [], allActive ?? [], allRecovered ?? [], allDeaths ?? []) }
    func getPieChartDataForState(stateData: StateViewModel) -> PieChartDataType {
        let deaths = stateData.deaths
        let recovered = stateData.discharged
        let active = stateData.active
        let labels = [CaseType.active.name, CaseType.recovered.name, CaseType.deceased.name]
        let values = [Double(active), Double(recovered), Double(deaths)]
        return (labels, values, false)
    }
    func getAllDistrictsOfState(state: StateViewModel) -> [DistrictViewModel] {
        if let test =  self.district?.filter({$0.key == state.loc}).values.first?.districtData {
            let cells = test.map { (key, value) -> DistrictViewModel in
                return DistrictViewModel(districtName: key, covidCases: value)
            }
            return cells.sorted(by: {$0.confirmed  > $1.confirmed })
        }
        return [DistrictViewModel]().sorted(by: {$0.confirmed  > $1.confirmed })
    }
}

struct HomeTabViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
