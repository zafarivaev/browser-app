//
//  AppCoordinator.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let navigationController = AppNavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        coordinate(to: mainCoordinator)
    }
}
