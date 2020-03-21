//
//  UINavigationController+extensions.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 18.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToRootViewController(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: animated)
        CATransaction.commit()
    }
}
