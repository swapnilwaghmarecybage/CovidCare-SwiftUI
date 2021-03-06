//
//  GuideLeftHand.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghm on 8/5/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import SwiftUI

struct GuideLeftHandCell: View {
    private var title: String
    private var description: String
    private var imageName: String
    init(title: String, description: String, imageName: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
    }
    var body: some View {
        HStack {
            Image(self.imageName)
                       .resizable()
                           .frame(width: 85, height: 85, alignment: .center)
                           .padding(.leading, CGFloat(15))
                            .cornerRadius(5)
            VStack {
                Text(self.title)
                    .foregroundColor(Color(Theme.labelColor))
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all, CGFloat(10))
                Text(self.description)
                .foregroundColor(Color(Theme.labelColor))
                .font(.system(size: 18, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, CGFloat(10))

            }
        }.background(Color(Theme.highlightedColor))
        .cornerRadius(10)
        .padding(.top, CGFloat(5))
        .padding(.bottom, CGFloat(5))
        .listRowBackground(Color(Theme.backgroundColor))
    }
}
