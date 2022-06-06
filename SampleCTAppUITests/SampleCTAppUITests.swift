//
//  SampleCTAppUITests.swift
//  SampleCTAppUITests
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import XCTest
@testable import SampleCTApp

class SampleCTAppUITests: XCTestCase {

    private var app: XCUIApplication!
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
    
    func testTable() {
        let myTable = app.tables.matching(identifier: "NewsTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "newCell_0")
        cell.tap()
    }
    
    func testTableCount() {
           let app = XCUIApplication()
           let tablesQuery = app.tables
           let count = tablesQuery.cells.count
           XCTAssert(count > 0)

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
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
