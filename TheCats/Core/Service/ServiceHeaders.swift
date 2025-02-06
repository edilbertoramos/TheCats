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
        headers["content-type"] = "application/json"
        headers["x-api-key"] = AppConfig.xApiKey
        return headers
    }
    
}
