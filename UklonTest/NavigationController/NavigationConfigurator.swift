//
//  NavigationConfigurator.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol NavigationConfiguratorProtocol: class {
    func makeViewController() -> NavigationController
    func config(viewController: NavigationController)
}

class NavigationConfigurator {
    let storyboard = UIStoryboard().createStoryboard(storyboardName: .Main)
}

extension NavigationConfigurator: NavigationConfiguratorProtocol {

    func makeViewController() -> NavigationController {
        guard let viewController = storyboard.instantiateInitialViewController() as? NavigationController else {
            fatalError("Couldn't create navigation controller")
        }
        
        viewController.configurator = self
        return viewController
    }

    func config(viewController: NavigationController) {
        let router = NavigationRouter(view: viewController)
        let presenter = NavigationPresenter(router: router, view: viewController)
        viewController.presenter = presenter
    }

}
