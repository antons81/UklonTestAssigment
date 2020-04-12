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
    var localizableName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isEditable
        case note
        case localizableName
    }
}
