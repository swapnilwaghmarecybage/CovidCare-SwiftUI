//
//  GuideView.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 7/28/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import SDWebImageSwiftUI

struct GuideView: View {
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor)
            List {
                Text("COVID common Symptoms")
                    .foregroundColor(Color(CaseType.confirmed.color))
                    .font(.system(size: 25, weight: .regular))
                    .listRowBackground(Color(Theme.backgroundColor))
                HStack {
                    AnimatedImage(name: "light_fever.gif",
                                  bundle: Bundle.main).frame(maxWidth: .infinity, minHeight: 130)
                    AnimatedImage(name: "light_cough.gif",
                                  bundle: Bundle.main).frame(maxWidth: .infinity, minHeight: 130)
                    AnimatedImage(name: "light_tiredness.gif",
                                  bundle: Bundle.main).frame(maxWidth: .infinity, minHeight: 130)
                }.background(Color(Theme.highlightedColor))
                    .cornerRadius(10)
                .listRowBackground(Color(Theme.backgroundColor))
                Text("Less common Symptoms")
                    .foregroundColor(Color(CaseType.confirmed.color))
                    .font(.system(size: 25, weight: .regular))
                    .listRowBackground(Color(Theme.backgroundColor))
                Text("\(Guide.lessCommonSymptoms)")
                    .foregroundColor(Color(Theme.labelColor))
                    .font(.system(size: 18, weight: .regular))
                    .lineSpacing(8)
                    .padding(.bottom, CGFloat(20))
                    .listRowBackground(Color(Theme.backgroundColor))
                Section(header: GuideSectionView(color: Color(CaseType.recovered.color),
                                                 title: "Do's", titleWidth: 80, sectionHeight: 50) ) {
                    GuideRightHandCell(title: Guide.Dos[0].title,
                                       description: Guide.Dos[0].description,
                                       imageName: Guide.Dos[0].imageName)
                    .padding(.top, CGFloat(20))

                    GuideLeftHandCell(title: Guide.Dos[1].title,
                                      description: Guide.Dos[1].description,
                                      imageName: Guide.Dos[1].imageName)
                    GuideRightHandCell(title: Guide.Dos[2].title,
                                       description: Guide.Dos[2].description,
                                       imageName: Guide.Dos[2].imageName)
                    GuideLeftHandCell(title: Guide.Dos[3].title,
                                      description: Guide.Dos[3].description,
                                      imageName: Guide.Dos[3].imageName)
                    .padding(.bottom, CGFloat(20))

                }
                Section(header: GuideSectionView(color: Color(CaseType.active.color),
                                                 title: "Dont's", titleWidth: 100, sectionHeight: 50)) {
                    GuideRightHandCell(title: Guide.Donts[0].title,
                                       description: Guide.Donts[0].description, imageName: Guide.Donts[0].imageName)
                    .padding(.top, CGFloat(20))
                    GuideLeftHandCell(title: Guide.Donts[1].title,
                                      description: Guide.Donts[1].description, imageName: Guide.Donts[1].imageName)
                    GuideRightHandCell(title: Guide.Donts[2].title,
                                       description: Guide.Donts[2].description, imageName: Guide.Donts[2].imageName)
                    GuideLeftHandCell(title: Guide.Donts[3].title,
                                      description: Guide.Donts[3].description, imageName: Guide.Donts[3].imageName)
                    .padding(.bottom, CGFloat(20))
                }
                Section(header: GuideSectionView(color: Color.purple,
                                                 title: "Psychological Guidelines", titleWidth: 260,
                                                 sectionHeight: 50)) {
                    Text("\(Guide.psycologicalGuidelines)")
                        .foregroundColor(Color(Theme.labelColor))
                        .font(.system(size: 18, weight: .regular))
                        .lineSpacing(5)
                        .padding(.top, CGFloat(20))
                        .listRowBackground(Color(Theme.backgroundColor))
                    Divider()
                        .listRowBackground(Color(Theme.backgroundColor))
                }
            }
        }
    }
}
