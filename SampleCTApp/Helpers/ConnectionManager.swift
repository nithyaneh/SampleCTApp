//
//  ConnectionManager.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import Reachability

class ConnectionManager {

    static let shared = ConnectionManager()
    private init () {}

    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability = try Reachability()
            var isNetworkReachable = false
            if reachability.connection == .wifi || reachability.connection == .cellular {
                isNetworkReachable = true
            }
            return isNetworkReachable
        } catch {
            return false
        }
    }
}
