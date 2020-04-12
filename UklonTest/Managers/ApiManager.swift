//
//  ApiManager.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 17.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation

enum DataType: String {
    case normalRequest = "normalRequest"
    case betaRequest = "betaRequest"
}

class APIManager  {
    
    static let shared: APIManager = APIManager()
    private init() {}
    
    func request<T: Decodable>(path: DataType,
                               resultObject: ((T) -> Void?),
                               failure: ((Error) -> Void)?) {
        
        if let url = Bundle.main.url(forResource: path.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                resultObject(jsonData)
            } catch let error {
                failure?(error)
            }
        }
    }
}

