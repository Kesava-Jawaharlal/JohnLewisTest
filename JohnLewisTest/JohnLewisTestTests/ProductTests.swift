//
//  ProductTests.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest
@testable import JohnLewisTest

class ProductTests: XCTestBaseClass {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: - General Tests
    func test_InitialiseProductWithEmptyJson() {
        //Init
        let json = convert(from: "{}")!
        
        //Subject
        let product = Product(from: json)
        
        //Tests
        XCTAssertNil(product)
    }
    
    func test_InitialiseProductWithOneItemInJson() {
        //Init
        let json = convert(from: "{" +
            "\"productId\": \"1212\", " +
            "\"title\": \"Dishwasher\", " +
            "\"image\": \"http://k.com/k.png\", " +
            "\"price\": { " +
                "\"now\": \"200.00\", " +
                "\"currency\": \"GBP\" " +
                "}" +
            "}")!
        
        //Subject
        let product = Product(from: json)
        
        //Tests
        XCTAssertNotNil(product)
    }
}
