//
//  HomeViewUITests.swift
//  SampleCTAppUITests
//
//  Created by Apple on 01/07/22.
//  Copyright © 2022 apple. All rights reserved.
//

import XCTest

@testable import SampleCTApp

class HomeViewUITests: XCTestCase {
    
    var timer: Timer!
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func setUp() {
        timer = Timer()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
       
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSearchHittable() {
        let waitExpectation = expectation(description: "Waiting")
        let searchButton = app.staticTexts["searchBtn"]
        XCTAssert(app.staticTexts["searchBtn"].exists)
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        let alert = app.alerts["Alert!"].scrollViews.otherElements
        let alertTitle = alert.staticTexts["Please type your category and search"]
        WaitExpectation().waitForElement(element: alertTitle, toShow: true, needToTap: false)
        XCTAssertTrue(alertTitle.exists, "no data alert shown")
        alert.buttons["OK"].tap()
    }
    
    func testSearchNavigation() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Business") 
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["News"].exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

class WaitExpectation: XCTestCase {
    func waitForElement(element: XCUIElement, toShow: Bool, needToTap: Bool, assertMessage: String? = nil) {
        let exists = NSPredicate(format: "exists == \(toShow)")
        var assertMsg = ""
        if let msg = assertMessage {
            assertMsg = msg
        } else {
            if toShow {
                assertMsg = "element appeared"
            } else {
                assertMsg = "element doesn't appeared"
            }
        }
        waitWithPredicate(predicate: exists, forElement: element, needToTap: needToTap, assertMessage: assertMsg)
    }
   func waitWithPredicate(predicate: NSPredicate, forElement: XCUIElement, needToTap: Bool, assertMessage: String) {
        expectation(for: predicate, evaluatedWith: forElement) { () -> Bool in
            if needToTap == true {
                forElement.tap()
            }
            XCTAssertEqual(1, 1, assertMessage)
            return true
        }
        waitForExpectations(timeout: 90, handler: nil)
    }
}
