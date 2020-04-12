//
//  WishesScreenViewControllerPresenter.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol WishesScreenPresenterDelegate: class {
    func didSelectRequests(_ items: PersonalRequests)
}

protocol WishesScreenPresenterProtocol: class {
    var view: WishesScreenViewControllerViewProtocol? { get set }
    func viewDidLoad()
    func fetchRequests(_ requestType: DataType)
    func closeScreen()
    func closeAndSaveScreen()
}


class WishesScreenViewControllerPresenter: NSObject {
    
    var requests = PersonalRequests() {
        didSet {
            view?.reloadData()
        }
    }
    
    var selectedItems = PersonalRequests() {
        didSet {
            view?.reloadData()
        }
    }
    
    var isDataSwitched: Bool = false

    // MARK: - Public variables
    internal weak var view: WishesScreenViewControllerViewProtocol?

    // MARK: - Private variables
    private let router: WishesScreenViewControllerRouterProtocol
    private weak var delegate: WishesScreenPresenterDelegate?
    private let service: WishesService
    
    // MARK: - Initialization
    init(router: WishesScreenViewControllerRouterProtocol,
         service: WishesService,
         view: WishesScreenViewControllerViewProtocol,
         selectedValue: Bool,
         delegate: WishesScreenPresenterDelegate?) {
        
        self.router = router
        self.view = view
        self.isDataSwitched = selectedValue
        self.delegate = delegate
        self.service = service
    }
}

extension WishesScreenViewControllerPresenter: WishesScreenPresenterProtocol {
    
    func closeScreen() {
        router.view?.navigationController?.popViewController(animated: true)
    }
    
    func closeAndSaveScreen() {
        router.view?.navigationController?.popToRootViewController(animated: true, completion: {
            self.delegate?.didSelectRequests(self.selectedItems)
        })
    }
    
    func fetchRequests(_ requestType: DataType) {
        service.fetchPersonalRequests(dataType: isDataSwitched ? .normalRequest : .betaRequest) { requests in
            self.requests = requests
        }
    }
    
    func viewDidLoad() {
        view?.setupTableView()
    }
}

extension WishesScreenViewControllerPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = requests[indexPath.row]
        let cell = provideTicketCell(for: tableView, at: indexPath, item: item)
        return cell
    }
    
    private func provideTicketCell(for tableView: UITableView, at indexPath: IndexPath,
                                   item: PersonalRequest) -> RequestCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RequestCell.self),
                                                       for: indexPath) as? RequestCell else {
                                                        fatalError("Could not create \(String(describing: RequestCell.self))")
        }
        
        cell.setupCellView(item, selectedItems.contains(where: { $0.id == item.id }))
        return cell
    }
}


extension WishesScreenViewControllerPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = requests[indexPath.row]
        
        if selectedItems.contains(where: { $0.id == item.id }) {
            selectedItems = selectedItems.filter { $0.id != item.id }
        } else {
            selectedItems.append(item)
        }
    }
}
