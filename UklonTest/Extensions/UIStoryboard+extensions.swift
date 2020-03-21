//
//  UIViewController+extensions.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case Main = "Main"
}

extension UIStoryboard {
    func createStoryboard<T: UIStoryboard>(storyboardName: StoryboardName) -> T {
        return T.init(name: storyboardName.rawValue, bundle: nil)
    }
}

