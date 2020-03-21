//
//  Thread+extensions.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 17.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation

func mainThread(_ completion: (() -> Void)?) {
    DispatchQueue.main.async {
        completion?()
    }
}
