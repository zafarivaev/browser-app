//
//  MainAssembly.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//  
//

import UIKit

enum MainAssembly {
    static func create(with coorinator: MainCoordinator) -> UIViewController {
        let view = MainView()
        let viewModel = MainViewModel(storageService: StorageService())
        let viewController = MainViewController(
            coordinator: coorinator,
            rootView: view,
            viewModel: viewModel
        )
        viewModel.output = viewController
        return viewController
    }
}
