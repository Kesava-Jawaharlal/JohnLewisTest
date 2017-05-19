//
//  XCTestBaseClass.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import XCTest

class XCTestBaseClass: XCTestCase {
    
    //MARK: - Helpers for string to dict
    func convert(from text: String) -> [String: Any]? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
