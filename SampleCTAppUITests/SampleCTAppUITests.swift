//
//  SampleCTAppUITests.swift
//  SampleCTAppUITests
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import XCTest
import DropDown
@testable import SampleCTApp

class SampleCTAppUITests: XCTestCase {

    private var app: XCUIApplication!
    private var dropDown = DropDown()
   // private var contentViewPage: ContentViewPage!
    var timer: Timer!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        timer = nil
    }
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        timer = Timer()
        app.launch()
    }
    
    func testArticleListNotLoaded() {
        let searchButton = app.staticTexts["Search"]
        let waitExpectation = expectation(description: "Waiting")
        XCTAssertTrue(searchButton.isHittable, "Search Button is Hittable")
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        XCTAssertFalse(tableCell.exists, "Table list not loaded")
    }
    
    func testArticleListisLoaded(){
        
        let searchButton =  app.buttons["Search"].staticTexts["Search"]
        let waitExpectation = expectation(description: "Waiting")
        XCTAssertTrue(searchButton.isHittable, "Search Button is Hittable")
        //app.buttons["dropButton"].tap()
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 60)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
        }
    }
}
