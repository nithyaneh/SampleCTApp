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
    var numberOfSections: Int {
        return self.categories.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.categories[section].articles.count == 0 ? 0 : self.categories[section].articles.count
    }
    
    func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return 60.0
    }
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
