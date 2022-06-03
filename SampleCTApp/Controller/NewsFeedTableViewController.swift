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
    
    private var categoryListVM: CategoryListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateHeadlinesAndArticles()
    }
    
    private func populateHeadlinesAndArticles() {
        if ConnectionManager.shared.hasConnectivity() {
            CategoryService().getAllHeadlinesForAllCategories { [weak self] categories in
                self?.categoryListVM = CategoryListViewModel(categories: categories)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
        } else {
            AlertHandler.showAlert(forMessage: Constants.Network.errorMessage, title: Constants.Network.errorTitle, defaultButtonTitle: Constants.ShowAlert.okTitle, sourceViewController: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.categoryListVM.heightForHeaderInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title: name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineCell", for: indexPath) as? NewsHeadlineCell else { fatalError("NewsHeadlineCell not found") }
        tableView.separatorStyle = .singleLine
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        
        cell.configure(vm: articleVM)
        
        return cell
    }
}
