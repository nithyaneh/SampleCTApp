//
//  UIImage+Extensions.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageForPlaceholder() -> UIImage {
        return UIImage(named: "Placeholder")!
    }
    
    static func imageForHeadline(url: String, completion: @escaping (UIImage) -> ()) {
        guard let imageURL = URL(string: url) else {
            completion(UIImage.imageForPlaceholder())
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                if let downloadImage = UIImage(data: data) {
                    completion(downloadImage)
                }
            }
        }
    }
}
