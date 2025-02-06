//
//  AppConfig.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

struct AppConfig {
    
    enum Parameter: String {
        case baseUrl = "BASE_URL"
        case connectionProtocol = "CONNECTION_PROTOCOL"
        case xApiKey = "X_API_KEY"
    }
    
    static var baseUrl: String {
        data(from: .baseUrl) ?? ""

    }
    
    static var connectionProtocol: String {
        data(from: .connectionProtocol) ?? ""
    }
    
    static var xApiKey: String {
        data(from: .xApiKey) ?? ""
    }
    
    static func data(from parameter: Parameter) -> String? {
        return Bundle.main.object(forInfoDictionaryKey: parameter.rawValue) as? String
    }
    
}
