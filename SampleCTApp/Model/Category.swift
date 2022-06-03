//
//  Category.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

struct Category {
    let title: String
    let articles: [Article]
    
    static func all() -> [String] {
        return ["Business", "Entertainment", "General", "Sports"]
    }
}
