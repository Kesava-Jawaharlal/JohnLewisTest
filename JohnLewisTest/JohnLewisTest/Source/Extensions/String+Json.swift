//
//  String+Json.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import Foundation

extension String {
    //MARK: - Helpers for string to dict
    func convertToJsonDict() -> [String: Any]? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getSymbolForCurrencyCode() -> String? {
        let locale = NSLocale(localeIdentifier: self)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: self)
    }
}
