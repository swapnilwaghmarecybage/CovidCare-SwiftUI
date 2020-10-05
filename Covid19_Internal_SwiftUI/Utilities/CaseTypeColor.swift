//
//  CaseTypeColor.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghmare on 10/05/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import SwiftUI

extension CaseType {
  /// return the color code specific to the case type
  var color: UIColor {
    switch self {
    case .confirmed:
      return UIColor(named: "confirmed") ?? UIColor.orange
    case .active:
      return UIColor(named: "active") ?? UIColor.red
    case .recovered:
      return UIColor(named: "recovered") ?? UIColor.green
    case .deceased:
      return UIColor(named: "deceased") ?? UIColor.black
    }
  }
}
