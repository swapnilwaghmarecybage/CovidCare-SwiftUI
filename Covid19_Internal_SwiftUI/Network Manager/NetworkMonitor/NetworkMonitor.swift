//
//  NetworkMonitor.swift
//  Covid19_Internal_SwiftUI
//
//  Created by Swapnil Waghmare on 01/10/20.
//  Copyright © 2020 Cybage. All rights reserved.
//

import Foundation
import Network

class NetworkMonitor {
    private  var monitor: NWPathMonitor?
    static let shared = NetworkMonitor()
    private init() { }
     func startMonitoring() {
        monitor = NWPathMonitor()
        let queue = DispatchQueue.global(qos: .background)
        monitor?.start(queue: queue)
    }
     func stopMonitoring() {
        monitor?.cancel()
    }
   private  func checkConnectionStatus() {
        monitor?.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connected")
                NotificationCenter.default.post(Notification(name: networkReceivedNotification))
            }
        }
    }
}
