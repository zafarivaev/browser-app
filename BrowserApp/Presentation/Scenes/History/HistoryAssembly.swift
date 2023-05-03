//
//  HistoryAssembly.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//  
//

import UIKit

enum HistoryAssembly {
    static func create(with coorinator: HistoryCoordinator) -> UIViewController {
        let view = HistoryView()
        let viewModel = HistoryViewModel(storageService: StorageService())
        let viewController = HistoryViewController(
            coordinator: coorinator,
            rootView: view,
            viewModel: viewModel
        )
        viewModel.output = viewController
        return viewController
    }
}
