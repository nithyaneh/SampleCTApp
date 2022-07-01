//
//  Loader.swift
//  SampleCTApp
//
//  Created by Apple on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

class Loader {
    
    static let shared = Loader()
    let indicator = UIActivityIndicatorView()
    
    func loadInd(vc : UIViewController) {
        indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        indicator.style = .medium
        indicator.center = vc.view.center
        vc.view.addSubview(indicator)
    }

    func showActIndicator() {
      
        indicator.startAnimating()
        
    }
    func stop() {
        indicator.stopAnimating()

    }
    
    
}
