//
//  JSONParserTests.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest
@testable import JohnLewisTest

class JSONParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: - General Tests
    func test_InitialiseParserWithEmptyJson() {
        //Subject
        let productList = JSONParser.parse(jsonString: "{}")
        
        //Tests
        XCTAssertNotNil(productList)
        XCTAssertEqual(productList.count, 0)
    }
    
    func test_InitialiseParserWithOneProduct() {
        //Subject
        let productList = JSONParser.parse(jsonString: "{ \"products\":[{\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\", \"price\": { \"now\": \"200.00\", \"currency\": \"GBP\" } }]}")
        
        //Tests
        XCTAssertNotNil(productList)
        XCTAssertEqual(productList.count, 1)
    }
    
    func test_InitialiseParserWithMultipleProducts() {
        //Subject
        let productList = JSONParser.parse(jsonString: "{ \"products\":[{\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\", \"price\": { \"now\": \"200.00\", \"currency\": \"GBP\" } }, {\"productId\": \"1212\", \"title\": \"Dishwasher\", \"image\": \"http://k.com/k.png\", \"price\": { \"now\": \"200.00\", \"currency\": \"GBP\" } }]}")
        
        //Tests
        XCTAssertNotNil(productList)
        XCTAssertEqual(productList.count, 2)
    }
}
