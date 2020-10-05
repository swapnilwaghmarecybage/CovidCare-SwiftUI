//
//  CovidList.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/28/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct HomeList: View {
    @ObservedObject var homeTabViewModel: HomeTabViewModel
    @Binding private var selectedSegmentedIndex: Int
    init(homeTabViewModel: HomeTabViewModel, index: Binding<Int>) {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        self.homeTabViewModel = homeTabViewModel
        self._selectedSegmentedIndex = index
    }
    var body: some View {
        List {
            if self.selectedSegmentedIndex == 0 {
                TotalCountTableViewCell(totalCountObject: self.homeTabViewModel.getIndiaObject())
                GraphCell(chartDataType: self.homeTabViewModel.getDataForIndiaBarChart())
                ForEach(self.homeTabViewModel.getStatesOfIndia()) { currentState in
                    ZStack {
                    ChildCountTableViewCell(regionDetails: currentState )
                    NavigationLink(destination: DistrictList(stateViewModel: currentState,
                     alldistricts: self.homeTabViewModel.getAllDistrictsOfState(state: currentState),
                     barGraph: self.homeTabViewModel.getDataForStateHistoryBarChart(state: currentState),
                    pieChart: self.homeTabViewModel.getPieChartDataForState(stateData: currentState))) {
                        EmptyView().frame(width: 0, height: 0) // To avoid Navigation link arrow
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }.listRowBackground(Color.clear)
            } else {
                TotalCountTableViewCell(totalCountObject: self.homeTabViewModel.getWorldObjcect())
                GraphCell(chartDataType: self.homeTabViewModel.getDataForWorldPieChart())
                ForEach(self.homeTabViewModel.getCountries()) { currentCountry in
                    ChildCountTableViewCell(regionDetails: currentCountry )
                }
            }
        }
        .listRowBackground(Color.clear)
    }
}
