//
//  TotalCountView.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/28/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct TotalCountTableViewCell: View {
    private var totalCases = 0
    private var totalRecovered = 0
    private var totalDeaths = 0
    private var newcases = 0
    private var newRecoverrd = 0
    private var newDeaths = 0

    init(totalCountObject: Any?) {
        UITableViewCell.appearance().backgroundColor = .clear
        if let india  = totalCountObject as? CountryViewModel {
            totalCases = india.totalCases
            totalRecovered = india.totalRecovered
            totalDeaths = india.totalDeaths
            newcases = india.newCases
            newDeaths = india.newDeaths
            newRecoverrd = india.newRecovered
        } else  if let world = totalCountObject as? WorldViewModel {
            totalCases = world.totalCases
            totalRecovered  = world.totalRecovered
            totalDeaths = world.totalDeaths
            newcases = world.newCases
            newRecoverrd = world.newRecovered
            newDeaths = world.newDeaths
        }

    }
    private var widthOfcontainer: CGFloat = UIScreen.main.bounds.width
    private var heightOfContainer: CGFloat = 140
    private var scaleFactor: CGFloat = 0.35
    var body: some View {
        Group {
            HStack {
                VStack {
                    Text("Confirmed ").foregroundColor(Color(Theme.labelColor))
                    .frame(width: scaleFactor*widthOfcontainer, alignment: .center)
                    Divider()
                    Text("Recovered ").foregroundColor(Color(Theme.labelColor))
                    .frame(width: scaleFactor*widthOfcontainer, alignment: .center)
                    Divider()
                    Text("Deceased ").foregroundColor(Color(Theme.labelColor))
                    .frame(width: scaleFactor*widthOfcontainer, alignment: .center)
                }.frame( height: heightOfContainer)
                VStack {
                    Text("\(totalCases ) (+\(newcases  ))").foregroundColor(Color(CaseType.confirmed.color))
                   .frame(width: (1-scaleFactor)*widthOfcontainer, alignment: .leading)
                    Divider()
                    Text("\(totalRecovered) (+\(newRecoverrd ))").foregroundColor(Color(CaseType.recovered.color))
                    .frame(width: (1-scaleFactor)*widthOfcontainer, alignment: .leading)
                    Divider()
                    Text("\(totalDeaths) (+\(newDeaths ))").foregroundColor(Color(CaseType.deceased.color))
                    .frame(width: (1-scaleFactor)*widthOfcontainer, alignment: .leading)
                }.frame( height: heightOfContainer, alignment: .leading)

            }
                .position(x: UIScreen.main.bounds.width/2, y: heightOfContainer/2)
                .background(Color(Theme.highlightedColor))
                .cornerRadius(10)
                .padding(.top, CGFloat(5))
                .padding(.bottom, CGFloat(5))
        }.padding(.leading, CGFloat(10))
        .padding(.trailing, CGFloat(10))
        .listRowBackground(Color(Theme.backgroundColor))
    }
}

struct TotalCountCellView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
