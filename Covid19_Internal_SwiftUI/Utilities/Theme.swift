//
//  Theme.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghmare on 05/10/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import SwiftUI
struct Theme {
    static var backgroundColor: UIColor {
        return UIColor(named: "backgroundColor") ??
            UIColor(red: 60/255, green: 100/255, blue: 123/255, alpha: 1.0)}
    static var highlightedColor: UIColor {
        return  UIColor(named: "highlightedColor") ??
            UIColor(red: 25/255, green: 57/255, blue: 79/255, alpha: 1.0)}
    static var labelColor: UIColor {
        return UIColor(named: "labelColor") ??
            UIColor.white}
    static var unSelectedSegmentControlColor: UIColor {
        return UIColor(named: "unSelectedSegmentControlColor") ??
        UIColor(red: 16/255, green: 16/255, blue: 16/255, alpha: 1.0) }
    static var selectedSegmentControlColor: UIColor {return
        UIColor(named: "selectedSegmentControlColor") ??
        UIColor(red: 255/255, green: 152/255, blue: 0/255, alpha: 1.0) }
    static var tabUnselectedColor: UIColor {
        return UIColor(named: "tabUnselectedColor") ??
            UIColor(red: 16/255, green: 16/255, blue: 16/255, alpha: 1.0) }
    static var tabselectedColor: UIColor {
        return UIColor(named: "tabselectedColor") ??
            UIColor(red: 255/255, green: 152/255, blue: 0/255, alpha: 1.0) }
    static var navigationBarbackgroundColor: UIColor {return
        UIColor(named: "navigationBarbackgroundColor") ??
        UIColor(red: 25/255, green: 57/255, blue: 79/255, alpha: 1.0) }
    static var tabBarBackgroundColor: UIColor {return
        UIColor(named: "tabBarBackgroundColor") ?? UIColor(red: 25/255, green: 57/255, blue: 79/255, alpha: 1.0) }
}
