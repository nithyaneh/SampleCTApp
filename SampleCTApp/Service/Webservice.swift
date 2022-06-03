//
//  Webservice.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

struct Resource<T> {
    let url: URL
    let parce: (Data) -> T?
}

var activityIndicator = UIActivityIndicatorView()

class Webservice {
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> ()) {
        activityIndicator.startAnimating()

        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parce(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
