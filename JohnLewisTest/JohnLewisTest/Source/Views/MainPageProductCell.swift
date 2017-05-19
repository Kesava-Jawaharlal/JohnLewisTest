//
//  MainPageProductCell.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import UIKit
import AlamofireImage

class MainPageProductCell: UICollectionViewCell {
    
    static let reuseIdentifierString = "mainPageProductCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //MARK: - Vars
    var data: Product? {
        didSet {
            descriptionLabel.text = data?.title
            priceLabel.text = data!.price.currencySymbol + "\(data!.price.value)"
            imageView.af_setImage(withURL: data!.imageUrl)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.af_cancelImageRequest()
        imageView.layer.removeAllAnimations()
        imageView.image = nil
    }
}
