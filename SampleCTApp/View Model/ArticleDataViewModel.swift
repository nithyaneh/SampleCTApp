//
//  ArticleDataViewModel.swift
//  SampleCTApp
//
//  Created by Apple on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

protocol ArticleDataViewProtocol {
    func getData(category: String) async
    var reload : () -> () { get set }
    var articles : [Article]? { get set}
    var reloadArticleList: (([Article]) -> Void)? { get  set}
    var showErrorResponse: ((Error) -> Void)? { get  set}
}


class ArticleDataViewModel: ArticleDataViewProtocol {
    
    var reloadArticleList: (([Article]) -> Void)?
    private var articleViewProtocol: WebserviceProtocol

    init(articleViewProtocol: WebserviceProtocol) {
        self.articleViewProtocol = articleViewProtocol
    }
    
    //Observer for data loading
    var reload = { ()->() in }
    
    var showErrorResponse: ((Error) -> Void)?
    
    var displayError: Error? {
        didSet {
            guard let responseError = displayError else { return  }
            showErrorResponse?(responseError)
        }
    }
    
    var articles : [Article]? = [] {
        didSet {
            reloadArticleList?(articles ?? [])
        }
    }
    
    //Load news articles with response
    func getData(category: String) async {
        
        if (category.isEmpty) {
            return
        }
        
        let resultResp = await articleViewProtocol.sendRequest(endpoint: CategoryEndpoint.categoryCountry(category: category), responseModel: NewsSourcesResponse.self)
        switch resultResp {
        case .success(let response):
            self.articles = response.articles
            if (self.articles?.count == 0) {
                displayError = ErrorHandler.noResponse
            }
        case .failure(let error):
            displayError = error
        }
        
    }
}
