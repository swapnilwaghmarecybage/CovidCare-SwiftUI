//
//  CaseType.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghmare on 10/05/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation

/// Cases type and the visual name for the type
enum CaseType {
  /// Specific cases typ like total cases, active cases, recoverd and decreased.
  /// Total cases
  case confirmed
  /// Current active cases
  case active
  /// Total recovered cases
  case recovered
  /// Total decreased cases
  case deceased
}
///
///
extension CaseType {
  var name: String {
    switch self {
    case .confirmed:
      return "Confirmed"
    case .active:
      return "Active"
    case .recovered:
      return "Recovered"
    case .deceased:
      return "Deceased"
    }
  }
}
///
///
extension CaseType {
  var barTag: Int {
    switch self {
    case .confirmed:
      return 101
    case .active:
      return 201
    case .recovered:
      return 301
    case .deceased:
      return 401
    }
  }
}
