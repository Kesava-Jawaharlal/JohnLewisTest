//
//  JSONParser.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import Foundation

fileprivate enum ParsingKey {
    static let products = "products"
}

class JSONParser {
    static func parse(jsonString: String) -> [Product] {
        guard let jsonDict = jsonString.convertToJsonDict(),
        let productsList = jsonDict[ParsingKey.products] as? [[String: Any]] else {
            return []
        }
        
        var result = [Product]()
        
        productsList.forEach { (productDict) in
            if let product = Product(from: productDict) {
                result.append(product)
            }
        }
        
        return result
    }
}
