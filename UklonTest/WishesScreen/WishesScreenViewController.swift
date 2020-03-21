//
//  WishesScreenViewControllerViewController.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol WishesScreenViewControllerViewProtocol: class {
    func reloadData()
    func setupTableView()
}

class WishesScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties
    var presenter: WishesScreenPresenterProtocol?
    var configurator: WishesScreenViewControllerConfiguratorProtocol?
    
    // MARK: - Private properties
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator?.config(viewController: self)
        presenter?.viewDidLoad()
        fetchRequests()
    }
    
    // MARK: - Display logic
    func setupTableView() {
        tableView?.tableFooterView = UIView(frame: .zero)
        tableView?.dataSource = presenter as? UITableViewDataSource
        tableView?.delegate = presenter as? UITableViewDelegate
        tableView?.estimatedRowHeight = 50
        tableView?.rowHeight = UITableView.automaticDimension
        let requestCell = UINib(nibName: String(describing: RequestCell.self), bundle: nil)
        tableView?.register(requestCell, forCellReuseIdentifier: String(describing: RequestCell.self))
    }
    
    // MARK: - Actions
    func fetchRequests() {
        presenter?.fetchRequests(.normalRequest)
    }
    
    @IBAction func close() {
        presenter?.closeScreen()
    }
    
    @IBAction func closeAndSave() {
        presenter?.closeAndSaveScreen()
    }
    
    // MARK: - Overrides
    
    // MARK: - Private functions
}

extension WishesScreenViewController: WishesScreenViewControllerViewProtocol {
    
    func reloadData() {
        mainThread {
            self.tableView.reloadData()
        }
    }
}
