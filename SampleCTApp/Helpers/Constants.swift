//
//  Constants.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let apikey = "d9435b3ac8e1464ea4b9e800a22680ca"
    
    struct Network {
        static let errorMessage = "Please check your internet connection and try again"
        static let errorTitle = "No internet connection"
    }
    
    struct ShowAlert {
        static let enterCityName = "Please enter city name"
        static let okTitle = "OK"
        static let alertTitle = "Alert!"
    }
    static func readJSONFromFile(fileName: String) -> Any? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    return dictionary
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        }
        return nil
    }
    
    static func isCydiaAppInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    static func canEditSandboxFilesForJailBreakDetecttion() -> Bool {
        let jailBreakTestText = "Test for JailBreak"
        do {
            try jailBreakTestText.write(toFile:"/private/jailBreakTestText.txt", atomically:true, encoding:String.Encoding.utf8)
            return true
        } catch {
            return false
        }
    }
    static func loadJson(filename fileName: String) -> [String: AnyObject]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: AnyObject] {
                    return dictionary
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
}


