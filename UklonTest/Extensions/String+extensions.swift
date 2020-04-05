//
//  String+extensions.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 04.04.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
