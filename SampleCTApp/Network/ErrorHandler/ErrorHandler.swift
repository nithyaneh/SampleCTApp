//
//  ErrorHandler.swift
//  SampleCTApp
//
//  Created by Apple on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

enum ErrorHandler: Error {
    case connectionError
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    var customMessage: String {
        switch self {
        case .connectionError:
            return "Internet connection is not available"
        case .unauthorized:
            return "Session expired"
        case .invalidURL:
            return "Invalid url is loaded"
        case .noResponse:
            return "No data is available"
        default:
            return "Invalid Data is given"
        }
    }
}
