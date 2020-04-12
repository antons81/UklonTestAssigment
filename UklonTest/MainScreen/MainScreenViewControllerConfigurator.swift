//
//  MainScreenViewControllerConfigurator.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol MainScreenViewControllerConfiguratorProtocol: class {
    func makeViewController() -> MainScreenViewController
    func config(viewController: MainScreenViewController)
}

class MainScreenViewControllerConfigurator {
    let storyboard = UIStoryboard().createStoryboard(storyboardName: .Main)
}

extension MainScreenViewControllerConfigurator: MainScreenViewControllerConfiguratorProtocol {
    
    func makeViewController() -> MainScreenViewController {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: MainScreenViewController.self)) as? MainScreenViewController else {
            fatalError("Couldn't create  \(String(describing: MainScreenViewController.self))")
        }
        viewController.configurator = self
        return viewController
    }
    
    func config(viewController: MainScreenViewController) {
        let router = MainScreenViewControllerRouter(view: viewController)
        let presenter = MainScreenViewControllerPresenter(router: router, view: viewController)
        viewController.presenter = presenter
    }
}
