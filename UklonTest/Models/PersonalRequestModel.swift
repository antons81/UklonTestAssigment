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
    let id: Int
    let name: String
    let isEditable: Bool
    let note: String
    let localizableName: String
}
