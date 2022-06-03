//
//  URL+Extensions.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

extension URL {
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&country=us&apiKey=\(Constants.apikey)")! // \(API.Key)
    }
}
