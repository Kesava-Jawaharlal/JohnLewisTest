//
//  Network.swift
//  JohnLewisTest
//
//  Created by Kesavasankar Jawaharlal on 19/05/2017.
//  Copyright © 2017 Small Screen Science Ltd. All rights reserved.
//

import Foundation

enum HTTPClientError: Error {
    case invalidDataReturned
}

class Network {
    static func makeGetCall(with url: URL, completion: @escaping (_ result: String?, _ error: HTTPClientError?) -> ()) {
        
        var config                              :URLSessionConfiguration!
        var urlSession                          :URLSession!
        
        config = URLSessionConfiguration.default
        urlSession = URLSession(configuration: config)
        
        var request = URLRequest.init(url: url)
        
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            guard let data = data , error == nil else {
                return completion(nil, HTTPClientError.invalidDataReturned)
            }
            
            if let result = String(data: data, encoding: .utf8) {
                completion(result, nil)
            }
        }
        
        dataTask.resume()
    }
}
