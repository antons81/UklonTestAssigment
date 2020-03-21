//
//  MainScreenViewControllerViewController.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 16.03.2020.
//  Copyright (c) 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

protocol MainScreenViewControllerViewProtocol: class {
    func setupTableView()
    func reloadData()
    func showWishesScreen()
}

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties
    var presenter: MainScreenViewControllerPresenterProtocol?
    var configurator: MainScreenViewControllerConfiguratorProtocol?
    let tableViewRowHeight: CGFloat = 60
    
    // MARK: - Private properties
    private var switchValue = false
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator?.config(viewController: self)
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Display logic
    func setupTableView() {
        tableView?.tableFooterView = UIView(frame: .zero)
        tableView?.dataSource = presenter as? UITableViewDataSource
        tableView?.delegate = presenter as? UITableViewDelegate
        tableView?.rowHeight = tableViewRowHeight
        let requestCell = UINib(nibName: String(describing: RequestCell.self), bundle: nil)
        tableView?.register(requestCell, forCellReuseIdentifier: String(describing: RequestCell.self))
    }
    
    // MARK: - Actions
    @IBAction func switchedData(sender: UISwitch) {
        switchValue = sender.isOn
    }
    
    @IBAction func showWishesScreen() {
        presenter?.showWishesScreen(switchValue)
    }
    
    // MARK: - Overrides
    
    // MARK: - Private functions
}

extension MainScreenViewController: MainScreenViewControllerViewProtocol {
    func reloadData() {
        mainThread {
            self.tableView.reloadData()
        }
    }
}
