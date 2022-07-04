//
//  NewsFeedTableViewController.swift
//  SampleCTApp9][
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import Reachability
import SafariServices

class NewsFeedTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    private var arrArticles: [Article]?
    lazy var newsDataViewModel: ArticleDataViewProtocol = {
        ArticleDataViewModel.init(articleViewProtocol:Webservice())
    }()  as ArticleDataViewProtocol
    var categoryTitle: String!
    
    //MARK: - View Controller Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Loader.shared.loadInd(vc: self)
        Loader.shared.showActIndicator()
        loadNewsDataWithTableView()
        loadFailWithError()

    }
    //MARK: - Load datae

    private func loadNewsDataWithTableView() {

        Task { [weak self] in
                await self?.newsDataViewModel.getData(category: categoryTitle)
            }
        
        newsDataViewModel.reloadArticleList = { [weak self] (articles) in
            DispatchQueue.main.async {
                self?.arrArticles = articles
                self!.tableView.reloadData()
                Loader.shared.stop()
            }
        }
    }
    
    private func loadFailWithError() {
        newsDataViewModel.showErrorResponse = { [weak self] error in
            Task { [weak self] in
                if let customError = error as? ErrorHandler {
                    AlertHandler.showAlert(forMessage: customError.customMessage, title: Constants.Network.errorText, defaultButtonTitle: Constants.ShowAlert.okTitle, sourceViewController: self!)
                }
            }
        }
    }

    //MARK: - Delegates and Datasource

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return arrArticles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = categoryTitle
        return UIView.viewForSectionHeader(title: name ?? "")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return loadNewsHeadLineCell(tableView, cellForRowAt: indexPath)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let urlString = arrArticles?[indexPath.row].url {
            guard let url = URL(string: urlString) else {
                return
            }
            self.navigateToSafari(withURL: url)
        }
    }
}

extension NewsFeedTableViewController {
    // MARK: - Custom UI Creation
    private func loadNewsHeadLineCell (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: NewsHeadlineCell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineCell", for: indexPath) as?  NewsHeadlineCell, let articleData = arrArticles else {
            return UITableViewCell()
        }
        let articleArray = articleData[indexPath.row]
        cell.loadArticlesData(articleResults: articleArray)
        return cell
    }
   private func navigateToSafari(withURL url: URL) {
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
}
