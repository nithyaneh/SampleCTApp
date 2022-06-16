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
    
    private var articleListViewModel: ArticleViewModel?
    private var article: Article?
    private var articleArray: [Article] = []
    private var sourceData: NewsSourcesResponse?
    private var filename: String?
    private var data: Data?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test
        // articleListViewModel = ArticleViewModel(article: )
        let currentOperator = "Business"
        switch currentOperator {
        case "Business":
            filename = "News_Business"
        case "Sports":
            filename = "News_Sports"
        case "Entertainment":
            filename = "News_Entertainment"
        case "General":
            filename = "News_General"
        default:
            break
        }
        guard let fileData = filename else {
            return
        }
        data = try getData(fromJSON: fileData)
        guard let jsonData = data else {
            return
        }
        sourceData = try JSONDecoder().decode(NewsSourcesResponse.self, from: jsonData)
        articleArray = try JSONDecoder().decode(NewsSourcesResponse.self, from: jsonData).articles
        
    }
    
    func testMockForArtistViewModel() {
        for article in articleArray {
            
            let articleViewModel = ArticleViewModel(article: article)
            XCTAssert(articleArray.count > 0, "Data not received")
            XCTAssert(articleArray.count == 20 , "All articles are not loaded properly")
            XCTAssertNotNil(articleViewModel, "The article view model should not be nil.")
            XCTAssertNotNil(article.title, "The title should not be nil")
            XCTAssertNotNil(article.sourceName, "The sourcename should not be nil")
            
            guard let jsonData = data else {
                return
            }
            XCTAssertNoThrow(try JSONDecoder().decode(NewsSourcesResponse.self, from: jsonData))
        }
    }

override func tearDownWithError() throws {
    article = nil
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
extension XCTestCase {
    enum TestError: Error {
        case fileNotFound
    }
    
    func getData(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}

