//
//  ServiceHeaders.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct ServiceHeaders {
    
    static var authenticatedHeaders: [String: String] {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        headers["x-api-key"] = "live_XEy1MgNtBdi7q1DsQuc4dzMKo8suwjI4LA1kgZmOI5J5ywM8H9MHSomNSz4FY8gl"
        return headers
    }
    
}
