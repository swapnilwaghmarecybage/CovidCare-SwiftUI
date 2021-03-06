//
//  DistrictList.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 8/1/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import SwiftUI

struct DistrictList: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    private var alldistricts: [DistrictViewModel] = [DistrictViewModel]()
    private var stateViewData: StateViewModel?
    private var stateBarData: BarGraphDataType = ([], [], [], [], [])
    private var statePieChartData: PieChartDataType = ([], [], false)
    init(stateViewModel: StateViewModel, alldistricts: [DistrictViewModel],
         barGraph: BarGraphDataType, pieChart: PieChartDataType) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Theme.labelColor]
        UINavigationBar.appearance().barTintColor = Theme.navigationBarbackgroundColor

        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        self.alldistricts = alldistricts
        self.stateViewData = stateViewModel
        self.stateBarData = barGraph
        self.statePieChartData = pieChart
    }
    var btnBack : some View { Button(action: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    self.presentationMode.wrappedValue.dismiss() }}) {
            Text("Back")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .regular))
        }
    }
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor).edgesIgnoringSafeArea(.all)
            VStack {
                Divider()
                Text(self.stateViewData?.loc ?? "")
                    .font(.system(size: 25, weight: .regular))
                    .background(Color(Theme.backgroundColor))
                    .foregroundColor(Color(Theme.labelColor))
                Divider()
                List {
                    GraphCell(chartDataType: self.statePieChartData)
                    GraphCell(chartDataType: self.stateBarData)
                    ForEach(self.alldistricts) { currentDistrict in
                        ChildCountTableViewCell(regionDetails: currentDistrict)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationBarTitle("State Details", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}
