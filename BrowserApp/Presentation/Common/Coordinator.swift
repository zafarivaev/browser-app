//
//  Coordinator.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
