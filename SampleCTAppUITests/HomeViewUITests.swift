//
//  HomeViewUITests.swift
//  SampleCTAppUITests
//
//  Created by Apple on 01/07/22.
//  Copyright © 2022 apple. All rights reserved.
//

import XCTest
import DropDown

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
    
    func testSearchNavigation() {
       // app.launch()
        let waitExpectation = expectation(description: "Waiting")
        XCTAssert(app.buttons["Search"].exists)
        app.buttons["Search"].tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        XCTAssert(app.navigationBars["News"].exists)
    }
    func testSearchNotHittable() {
       // app.launch()
        let waitExpectation = expectation(description: "Waiting")
        XCTAssert(app.buttons["search"].exists)
        XCTAssertEqual(app.staticTexts["dropdown"].label, "Select your Category")
        app.buttons["dropButton"].tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        XCTAssertFalse(app.buttons["search"].isHittable, "Should not be hittable")
    }

    func testCategoryLabel() {
        let waitExpectation = expectation(description: "Waiting")
        XCTAssert(app.staticTexts["dropdown"].exists)
        let catLabel = app.staticTexts["dropdown"].label
        XCTAssertEqual(catLabel, "Select your Category")
        waitExpectation.fulfill()
        waitForExpectations(timeout: 2.0)
    }
    func testDropButton() {
        //app.launch()
        let waitExpectation = expectation(description: "Waiting")
        XCTAssert(app.buttons["dropButton"].exists)
        app.buttons["dropButton"].tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 2.0)
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
