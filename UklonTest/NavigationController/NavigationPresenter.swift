//
//  NavigationPresenter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol NavigationPresenterProtocol: class {
    var view: NavigationViewProtocol? { get set }
    func viewDidLoad()
}

class NavigationPresenter {
    // MARK: - Public variables
    internal weak var view: NavigationViewProtocol?

    // MARK: - Private variables
    private let router: NavigationRouterProtocol
    
    // MARK: - Initialization
    init(router: NavigationRouterProtocol, view: NavigationViewProtocol) {
        self.router = router
        self.view = view
    }

}

extension NavigationPresenter: NavigationPresenterProtocol {
    func viewDidLoad() {
        view?.setRootViewController()
    }
}
