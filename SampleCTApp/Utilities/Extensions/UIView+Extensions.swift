//
//  UIView+Extensions.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension UIView {
    static func viewForTableViewHeader(subtitle: String) -> UIView {
        let screenRect = UIScreen.main.bounds
        
        let subTitleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: screenRect.size.width, height: 44)))
        let subTitleLbl = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: screenRect.width, height: 44)))
        
        subTitleLbl.text = subtitle
        subTitleLbl.textAlignment = .center
        subTitleLbl.textColor = .gray
        
        subTitleView.addSubview(subTitleLbl)
        return subTitleView
    }

    
    static func viewForSectionHeader(title: String) -> UIView {
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        
        headerView.backgroundColor = .white
        
        let sectionHeaderLbl = UILabel(frame: headerView.frame)
        sectionHeaderLbl.text = title.uppercased()
        sectionHeaderLbl.textColor = .black
        sectionHeaderLbl.font = UIFont.fontForSectionHeaderTitle()
        
        headerView.addSubview(sectionHeaderLbl)
        
        return headerView
    }
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)

        self.addSubview(backgroundView)
    }

    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
