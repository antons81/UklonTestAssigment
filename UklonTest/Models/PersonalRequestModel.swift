//
//  WishesModel.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 17.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation


typealias PersonalRequests = [PersonalRequest]

struct PersonalRequest: Decodable {
    var id: Int
    var name: String
    var isEditable: Bool
    var note: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isEditable
        case note
    }
}

class RequestModel {
    static func fetchPersonalRequests(dataType: DataType, completion: ((PersonalRequests) -> Void)?) {
        APIManager.shared.request(path: dataType, resultObject: { requests in
            completion?(requests)
        }) { error in
            print(error.localizedDescription)
        }
    }
}
