//
//  MainCoordinator.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainAssembly.create(with: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func coordinateToHistory(itemSelectionHandler: @escaping (String) -> ()) {
        guard let navigationController = navigationController else { return }
        let coordinator = HistoryCoordinator(navigationController: navigationController)
        coordinator.itemSelectionHandler = itemSelectionHandler
        coordinate(to: coordinator)
    }
}
