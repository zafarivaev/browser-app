//
//  HistoryViewController.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//  
//

import UIKit

final class HistoryViewController: AppViewController {
    
    // MARK: - Properties
    
    private let coordinator: HistoryCoordinator
    private let rootView: HistoryView
    private let viewModel: HistoryViewModelInput
    private let dataSource = HistoryDataSource()
    
    // MARK: - Initialization
    
    init(
        coordinator: HistoryCoordinator,
        rootView: HistoryView,
        viewModel: HistoryViewModelInput
    ) {
        self.coordinator = coordinator
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = dataSource
        rootView.tableView.register(
            HistoryTableViewCell.self,
            forCellReuseIdentifier: HistoryTableViewCell.reuseIdentifer
        )
        viewModel.shouldFetchHistory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "History"
    }
}

// MARK: - UITableView Delegate

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.navigateBack(selectedItem: dataSource.items[indexPath.row])
    }
}

// MARK: - HistoryViewModel Output

extension HistoryViewController: HistoryViewModelOutput {
    func didFetchHistory(urlStrings: [String]) {
        dataSource.items = urlStrings
        rootView.tableView.reloadData()
    }
}
