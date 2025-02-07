//
//  UITestingHelper.swift
//  TheCats
//
//  Created by Edilberto Ramos on 06/02/25.
//

import Foundation

struct UITestingHelper {
    
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    static var isFeedSuccess: Bool {
        ProcessInfo.processInfo.environment["-feed-success"] == "1"
    }
    
}
