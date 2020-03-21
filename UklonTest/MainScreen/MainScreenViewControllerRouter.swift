//
//  MainScreenViewControllerRouter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol MainScreenViewControllerRouterProtocol: class {
    var view: MainScreenViewController? { get set }
    func openWishes(_ value: Bool)
}

class MainScreenViewControllerRouter {
    
    // MARK: - Public variables
    internal weak var view: MainScreenViewController?
    
    // MARK: - Initialization
    init(view: MainScreenViewController) {
        self.view = view
    }

}

extension MainScreenViewControllerRouter: MainScreenViewControllerRouterProtocol {
    
    func openWishes(_ value: Bool) {
        let wishes = WishesScreenViewControllerConfigurator().makeViewController(with: value, delegate: view as? WishesScreenPresenterDelegate)
        self.view?.navigationController?.pushViewController(wishes, animated: true)
    }
}
