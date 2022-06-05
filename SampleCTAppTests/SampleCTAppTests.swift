//
//  SampleCTAppTests.swift
//  SampleCTAppTests
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import XCTest
@testable import SampleCTApp

class SampleCTAppTests: XCTestCase {
    
    private var categoryListViewModel : CategoryListViewModel?
    
    private var articleListViewModel: ArticleViewModel?
    
    private var article: Article?
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test
       // articleListViewModel = ArticleViewModel(article: )
    }
    
    func testMockForCategoryListViewModel() {

        
     guard articleListViewModel != nil else {
                 return XCTFail("articleListViewModel, should be not nil")
             }
        
     guard categoryListViewModel != nil else {
                 return XCTFail("categoryListViewModel, should be not nil")
             }
        
    }
        
    
    func testMockBusinessAPISuccess() {
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
