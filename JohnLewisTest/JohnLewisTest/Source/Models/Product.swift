//
//  Product.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import Foundation

struct Product {
    var productId: Int
    var title: String
    var imageUrl: URL
    var price: Price?
    
    init?(from json: [String:Any]) {
        guard let productIdString = json["productId"] as? String,
            let productId = Int(productIdString),
            let title = json["title"] as? String,
            let imageUrlString = json["image"] as? String,
            let imageUrl = URL(string: imageUrlString) else {
                return nil
            }
        self.productId = productId
        self.title =  title
        self.imageUrl = imageUrl
    }
}

struct Price {
    var value: Float
    var currencyISOCode: String
}
