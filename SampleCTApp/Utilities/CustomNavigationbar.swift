//
//  CustomNavigationbar.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

class CustomNavBar {
    
    static func setup() {
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.188, green: 0.243, blue: 0.306, alpha: 1.00)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
