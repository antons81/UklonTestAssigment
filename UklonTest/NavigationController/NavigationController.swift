//
//  NavigationViewController.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol NavigationViewProtocol: class {
    func setRootViewController()
}

class NavigationController: UINavigationController {
    // MARK: - Public properties
    var presenter: NavigationPresenterProtocol?
    var configurator: NavigationConfiguratorProtocol?
    
    // MARK: - Private properties
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator?.config(viewController: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Display logic
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
}

extension NavigationController: NavigationViewProtocol {
    func setRootViewController() {
        self.setViewControllers([MainScreenViewControllerConfigurator().makeViewController()], animated: true)
    }
}
