//
//  HomeController..swift
//  SampleCTApp
//
//  Created by Apple on 02/07/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var categoryListView: UITextView!
    lazy var categoryType: [String] = {
        [unowned self] in
        return [Constants.Category.Business, Constants.Category.Sports, Constants.Category.Entertainment,Constants.Category.General,Constants.Category.Health]
    }()
    
//MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryListView.attributedText = String.bulletPointList(strings: categoryType)
        categoryTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button action
    
    @IBAction func SearchAct(_ sender: Any) {
        if !(categoryTextField.text == "") {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewsVC") as! NewsFeedTableViewController
            nextViewController.categoryTitle = categoryTextField.text
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
//MARK: - Extensions

extension HomeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
