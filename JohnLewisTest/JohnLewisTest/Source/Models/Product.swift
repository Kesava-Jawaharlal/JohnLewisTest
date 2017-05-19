//
//  Product.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import Foundation

fileprivate enum ParsingKey {
    static let productId = "productId"
    static let title = "title"
    static let image = "image"
    static let price = "price"
    static let value = "now"
    static let currency = "currency"
}

struct Product {
    var productId: Int
    var title: String
    var imageUrl: URL
    var price: Price
    
    init?(from json: [String:Any]) {
        guard let productIdString = json[ParsingKey.productId] as? String,
            let productId = Int(productIdString),
            let title = json[ParsingKey.title] as? String,
            let imageUrlString = json[ParsingKey.image] as? String,
            let imageUrl = URL(string: imageUrlString),
            let priceDict = json[ParsingKey.price] as? [String: Any],
            let price = Price(from: priceDict) else {
                return nil
            }
        self.productId = productId
        self.title =  title
        self.imageUrl = imageUrl
        self.price = price
    }
}

struct Price {
    var value: Float
    var currencyISOCode: String
    
    init?(from json: [String:Any]) {
        guard let valueString = json[ParsingKey.value] as? String,
            let value = Float(valueString),
            let currencyISOCode = json[ParsingKey.currency] as? String else {
                return nil
        }
        self.value = value
        self.currencyISOCode = currencyISOCode
    }
}
