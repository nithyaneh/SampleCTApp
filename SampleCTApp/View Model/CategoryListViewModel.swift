//
//  CategoryListViewModel.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

struct CategoryListViewModel {
    private(set) var categories: [Category]
}

extension CategoryListViewModel {
    func categoryAtIndex(index: Int) -> CategoryViewModel {
        return CategoryViewModel(name: categories[index].title, articles: categories[index].articles)
    }
    
    func articleForSectionAtIndex(section: Int, index: Int) -> ArticleViewModel {
        return categoryAtIndex(index: section).articleAtIndex(index: index)
    }
   
}


struct CategoryViewModel {
    let name: String
    let articles: [Article]
}

extension CategoryViewModel {
    func articleAtIndex(index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}
