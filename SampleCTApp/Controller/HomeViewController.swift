//
//  HomeViewController.swift
//  SampleCTApp
//
//  Created by Apple on 01/07/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import DropDown

class HomeViewController: UIViewController {

    let dropDown = DropDown()
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var dropdownLabel: UILabel!
    @IBOutlet weak var dropDownView: UIView!

    lazy var categoryType: [String] = {
        [unowned self] in
        return [Constants.Category.Business, Constants.Category.Sports, Constants.Category.Entertainment,Constants.Category.General]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDropDownUI()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropdownLabel.text = categoryType[index]
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dropdownLabel.text = Constants.dropDownTitle
    }

    @IBAction func showDropDown(_ sender: Any) {
       // dropDown.show()
        self.dropdownLabel.text = "Business"
        goButton.isUserInteractionEnabled = true
    }
    
    
    @IBAction func GoAct(_ sender: Any) {
        if !(dropdownLabel.text == Constants.dropDownTitle) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewsVC") as! NewsFeedTableViewController
            nextViewController.categoryTitle = dropdownLabel.text
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            AlertHandler.showAlert(forMessage: Constants.ShowAlert.selectCategory, title: Constants.ShowAlert.alertTitle, defaultButtonTitle: Constants.ShowAlert.okTitle, sourceViewController: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HomeViewController {
    func updateDropDownUI() {
        dropdownLabel.text = Constants.dropDownTitle
        dropDown.anchorView = dropDownView
        dropDown.dataSource = categoryType
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .top
        goButton.setTitleColor(UIColor.black, for: .normal)
        goButton.setTitle(Constants.searchTitle, for: .normal)
        goButton.isUserInteractionEnabled = false
    }
}
