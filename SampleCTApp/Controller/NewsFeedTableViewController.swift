//
//  NewsFeedTableViewController.swift
//  SampleCTApp9][
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import Reachability

class NewsFeedTableViewController: UITableViewController {
    //MARK:- Properties
    
    private var categoryListVM: CategoryListViewModel!

    
    //MARK:- View Controller Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateHeadlinesAndArticles()
        self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        tableView.accessibilityIdentifier = "NewsTableViewIdentifier"

    }
    
    private func populateHeadlinesAndArticles() {
        if ConnectionManager.shared.hasConnectivity() {
            CategoryService().getAllHeadlinesForAllCategories { [weak self] categories in
                self?.view.activityStopAnimating()
                self?.categoryListVM = CategoryListViewModel(categories: categories)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
        } else {
            AlertHandler.showAlert(forMessage: Constants.Network.errorMessage, title: Constants.Network.errorTitle, defaultButtonTitle: Constants.ShowAlert.okTitle, sourceViewController: self)
        }
    }
    
    //MARK:- Delegates and Datasource
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title: name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.categories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.categories[section].articles.count == 0 ? 0 : self.categoryListVM.categories[section].articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineCell", for: indexPath) as? NewsHeadlineCell else { fatalError("NewsHeadlineCell not found") }
        tableView.separatorStyle = .singleLine
        cell.accessibilityIdentifier = "newCell_\(indexPath.row)"
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        
        cell.configure(vm: articleVM)
        
        return cell
    }
}
