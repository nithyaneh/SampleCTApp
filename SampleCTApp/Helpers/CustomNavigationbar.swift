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
        
        UINavigationBar.appearance().topItem?.title = "NEWS"
        UINavigationBar.appearance().barTintColor = UIColor(red: 59/255, green: 128/255, blue: 167/255, alpha: 1.00)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      
            }
    
}
