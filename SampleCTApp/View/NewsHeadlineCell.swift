//
//  NewsHeadlineCell.swift
//  SampleCTApp
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class NewsHeadlineCell: UITableViewCell {
    
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
        self.headlineImgView.image = nil
       
    }

}

extension NewsHeadlineCell {
    
    func configure(vm: ArticleViewModel) {
        self.titleLbl.text = vm.title
        self.descriptionLbl.text = vm.description
        vm.image { self.headlineImgView.image = $0 }
    }
}
