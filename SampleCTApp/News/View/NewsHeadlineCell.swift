//
//  NewsHeadlineCell.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import Kingfisher

class NewsHeadlineCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var headlineImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headlineImgView.layer.cornerRadius = 8
        headlineImgView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headlineImgView.image = UIImage(named: "errorImage")
    }

}

extension NewsHeadlineCell {
    
    func loadArticlesData(articleResults: Article) {
        titleLbl.text =  articleResults.sourceName
        descriptionLbl.text =  articleResults.title
        guard let imageURL = articleResults.imageURL else {
            return
        }
        if imageURL.isValidURL {
            let loadingURLImage = URL(string: imageURL)
            headlineImgView.kf.indicatorType = .activity
            headlineImgView.kf.setImage(with: loadingURLImage)
        }
        
    }
}

