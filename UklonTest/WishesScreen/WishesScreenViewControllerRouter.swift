//
//  WishesScreenViewControllerRouter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol WishesScreenViewControllerRouterProtocol: class {
    var view: WishesScreenViewController? { get set }
}

class WishesScreenViewControllerRouter {
    // MARK: - Public variables
    internal weak var view: WishesScreenViewController?
    
    // MARK: - Initialization
    init(view: WishesScreenViewController) {
        self.view = view
    }

}

extension WishesScreenViewControllerRouter: WishesScreenViewControllerRouterProtocol {}
