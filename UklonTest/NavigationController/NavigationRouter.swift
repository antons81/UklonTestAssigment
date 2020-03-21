//
//  NavigationRouter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol NavigationRouterProtocol: class {
    var view: NavigationController? { get set }
}

class NavigationRouter {
    // MARK: - Public variables
    internal weak var view: NavigationController?
    
    // MARK: - Initialization
    init(view: NavigationController) {
        self.view = view
    }

}

extension NavigationRouter: NavigationRouterProtocol {}
