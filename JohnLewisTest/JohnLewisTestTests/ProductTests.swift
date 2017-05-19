//
//  ProductTests.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest
@testable import JohnLewisTest

class ProductTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: - General Tests
    func test_InitialiseProductWithEmptyJson() {
        //Init
        let json = "{}".convertToJsonDict()!
        
        //Subject
        let product = Product(from: json)
        
        //Tests
        XCTAssertNil(product)
    }
    
    func test_InitialiseProductWithoutPriceJson() {
        //Init
        let json = "{\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\" }".convertToJsonDict()!
        
        //Subject
        let product = Product(from: json)
        
        //Tests
        XCTAssertNil(product)
    }
    
    func test_InitialiseProductWithOneItemInJson() {
        //Init
        let json = "{\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\", \"price\": { \"now\": \"200.00\", \"currency\": \"GBP\" } }".convertToJsonDict()!
        
        //Subject
        let product = Product(from: json)
        
        //Tests
        XCTAssertNotNil(product)
    }
    
    func test_InitialiseProductAndSeeIfValuesAreProper() {
        //Init
        let json = "{\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\", \"price\": { \"now\": \"200.00\", \"currency\": \"GBP\" } }".convertToJsonDict()!
        
        //Subject
        let product = Product(from: json)!
        
        //Tests
        XCTAssertEqual(product.productId, 1212)
        XCTAssertEqual(product.title, "Dishwasher")
        XCTAssertEqual(product.imageUrl.absoluteString, "http://k.com/k.png")
    }
    
    
    //MARK: - Price Tests
    
    func test_InitialisePriceWithEmptyJson() {
        //Init
        let json = "{}".convertToJsonDict()!
        
        //Subject
        let price = Price(from: json)
        
        //Tests
        XCTAssertNil(price)
    }
    
    func test_InitialisePriceWithproperJson() {
        //Init
        let json = "{ \"now\": \"200.00\", \"currency\": \"GBP\" }".convertToJsonDict()!
        
        //Subject
        let price = Price(from: json)
        
        //Tests
        XCTAssertNotNil(price)
    }
    
    
    func test_InitialisePriceandseeIfValuesAreProper() {
        //Init
        let json = "{\"now\": \"200.00\",  \"currency\": \"GBP\"  }".convertToJsonDict()!
        
        //Subject
        let price = Price(from: json)!
        
        //Tests
        XCTAssertEqual(price.value, 200)
        XCTAssertEqual(price.currencyISOCode, "GBP")
    }
}
