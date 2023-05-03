//
//  HistoryCoordinator.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

final class HistoryCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    var itemSelectionHandler: ((String) -> ())?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HistoryAssembly.create(with: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateBack(selectedItem: String) {
        navigationController?.popViewController(animated: true)
        itemSelectionHandler?(selectedItem)
    }
}

