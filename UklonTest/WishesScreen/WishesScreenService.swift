//
//  WishesScreenService.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 12.04.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation


protocol WishesServiceProtocol {
    func fetchPersonalRequests(dataType: DataType, completion: ((PersonalRequests) -> Void)?)
}

class WishesService {}

extension WishesService: WishesServiceProtocol {
    func fetchPersonalRequests(dataType: DataType, completion: ((PersonalRequests) -> Void)?) {
        APIManager.shared.request(path: dataType, resultObject: { requests in
            completion?(requests)
        }) { error in
            print(error.localizedDescription)
        }
    }
}
