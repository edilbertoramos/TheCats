//
//  FeedViewSuccessUITests.swift
//  TheCatsUITests
//
//  Created by Edilberto Ramos on 06/02/25.
//

import XCTest

class FeedViewFailureUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-feed-success":"0"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testFailure() throws {
        // Validade Feed title
        let feedTitle = app.navigationBars["The Cats"]
        XCTAssertTrue(feedTitle.exists)
        
        sleep(2)
        
        // Validade error message
        let errorMessage = app.staticTexts["There was a service failure!"]
        XCTAssertTrue(errorMessage.exists)
    }
    
}
