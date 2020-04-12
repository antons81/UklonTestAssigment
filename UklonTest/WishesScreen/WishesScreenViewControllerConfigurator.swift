//
//  WishesScreenViewControllerConfigurator.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol WishesScreenViewControllerConfiguratorProtocol: class {
    func makeViewController(with value: Bool, delegate: WishesScreenPresenterDelegate?) -> WishesScreenViewController
    func config(viewController: WishesScreenViewController)
}

class WishesScreenViewControllerConfigurator {
    
    private weak var delegate: WishesScreenPresenterDelegate?
    
    let storyboard = UIStoryboard().createStoryboard(storyboardName: .Main)
    private var selectedValue = false
}

extension WishesScreenViewControllerConfigurator: WishesScreenViewControllerConfiguratorProtocol {
    
    func makeViewController(with value: Bool,
                            delegate: WishesScreenPresenterDelegate?) -> WishesScreenViewController {
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: WishesScreenViewController.self)) as? WishesScreenViewController else {
            fatalError("Couldn't create navigation controller")
        }
        
        viewController.configurator = self
        self.delegate = delegate
        selectedValue = value
        return viewController
    }

    func config(viewController: WishesScreenViewController) {

        let router = WishesScreenViewControllerRouter(view: viewController)
        let service = WishesService()
        let presenter = WishesScreenViewControllerPresenter(router: router,
                                                            service: service,
                                                            view: viewController,
                                                            selectedValue: selectedValue,
                                                            delegate: delegate)
        viewController.presenter = presenter
    }

}
