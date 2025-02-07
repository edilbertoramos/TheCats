//
//  FeedViewSuccessUITests.swift
//  TheCatsUITests
//
//  Created by Edilberto Ramos on 06/02/25.
//

import XCTest

class FeedViewSuccessUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-feed-success":"1"]
        app.launch()
    }
        
    override func tearDown() {
        app = nil
    }

    func testFullFlow() throws {
        
        // Validade Feed title
        let feedTitle = app.navigationBars["The Cats"]
        XCTAssertTrue(feedTitle.exists)
        
        sleep(2)

        // Validade Feed items
        let grid = app.otherElements["feedGrid"]
        let predicate = NSPredicate(format: "identifier CONTAINS 'item_'")
        let gridItems = grid.buttons.containing(predicate)
        XCTAssertGreaterThanOrEqual(gridItems.count, 10, "There should be 10 items on the screen")

        sleep(2)

        // Tap on a FeedCard to open FeedDetailView
        let firstFeedCard = grid.buttons.containing(predicate).firstMatch
        XCTAssertTrue(firstFeedCard.exists)
        firstFeedCard.tap()

        sleep(2)

        // Validade details
        let feedDetailTitle = app.navigationBars["American Curl"]
        XCTAssertTrue(feedDetailTitle.exists)

        let temperamentValue = app.staticTexts["Affectionate, Curious, Intelligent, Interactive, Lively, Playful, Social"]
        XCTAssertTrue(temperamentValue.exists)

        let lifeSpan = app.staticTexts["Life Span"]
        XCTAssertTrue(lifeSpan.exists)

        let lifeSpanValue = app.staticTexts["12 - 16"]
        XCTAssertTrue(lifeSpanValue.exists)
        
        let origin = app.staticTexts["Origin"]
        XCTAssertTrue(origin.exists)

        let originValue = app.staticTexts["United States"]
        XCTAssertTrue(originValue.exists)
        
        let weight = app.staticTexts["Weight"]
        XCTAssertTrue(weight.exists)

        let weightValue = app.staticTexts["2 - 5"]
        XCTAssertTrue(weightValue.exists)

        let hypoallergenic = app.staticTexts["Hypoallergenic"]
        XCTAssertTrue(hypoallergenic.exists)

        let hypoallergenicValue = app.staticTexts["No"]
        XCTAssertTrue(hypoallergenicValue.exists)
                                                  
        let aboutFeedDetailTitle = app.staticTexts["About American Curl"]
        XCTAssertTrue(aboutFeedDetailTitle.exists)

        // Scroll to the bottom
        let scrollView = app.scrollViews.element
        scrollView.swipeUp(velocity: .fast)
        scrollView.swipeUp(velocity: .fast)
        
        sleep(2)
        
        // Tap on the "Learn More on Wikipedia" button to open SafariView
        let learnMoreButton = app.buttons["Learn more on Wikipedia"]
        XCTAssertTrue(learnMoreButton.exists)
        learnMoreButton.tap()
        
        sleep(5)
        
        // Close SafariView
        let doneButton = app.buttons["Done"]
        XCTAssertTrue(doneButton.exists)
        doneButton.tap()

        sleep(2)
        
        let backButton = app.buttons["BackButton"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
    }
    
}
