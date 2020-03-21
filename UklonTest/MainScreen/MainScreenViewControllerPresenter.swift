//
//  MainScreenViewControllerPresenter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol MainScreenViewControllerPresenterProtocol: class {
    var view: MainScreenViewControllerViewProtocol? { get set }
    func showWishesScreen(_ value: Bool)
}

class MainScreenViewControllerPresenter: NSObject {
    
    // MARK: - Public variables
    internal weak var view: MainScreenViewControllerViewProtocol?

    // MARK: - Private variables
    private let router: MainScreenViewControllerRouterProtocol
    
    private var items = PersonalRequests() {
        didSet {
            view?.reloadData()
            print("============ Delegate result ==========")
            self.items.forEach { item in
                print(item.id, item.name)
            }
        }
    }
    
    // MARK: - Initialization
    init(router: MainScreenViewControllerRouterProtocol, view: MainScreenViewControllerViewProtocol) {
        self.router = router
        self.view = view
    }

}

extension MainScreenViewControllerPresenter: MainScreenViewControllerPresenterProtocol {

    func showWishesScreen(_ value: Bool) {
        let wishes = WishesScreenViewControllerConfigurator().makeViewController(with: value, delegate: self)
        router.view?.navigationController?.show(wishes, sender: self)
    }
}

extension MainScreenViewControllerPresenter: WishesScreenPresenterDelegate {
    func didSelectRequests(_ items: PersonalRequests) {
        self.items = items
    }
}

extension MainScreenViewControllerPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = provideTicketCell(for: tableView, at: indexPath, item: item)
        return cell
    }
    
    private func provideTicketCell(for tableView: UITableView, at indexPath: IndexPath,
                                   item: PersonalRequest) -> RequestCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RequestCell.self),
                                                       for: indexPath) as? RequestCell else {
                                                        fatalError("Could not create \(String(describing: RequestCell.self))")
        }
        
        cell.setupCellView(item, false)
        return cell
    }
}
