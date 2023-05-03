//
//  MainViewModel.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import Foundation

protocol MainViewModelInput: AnyObject {
    func didInputUrlString(_ string: String)
    func didPerformNavigation(with url: URL)
}

protocol MainViewModelOutput: AnyObject {
    func didPrepareUrlRequest(_ request: URLRequest)
}

final class MainViewModel: MainViewModelInput {
    
    weak var output: MainViewModelOutput?
    private let storageService: StorageServiceProtocol
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
    
    func didInputUrlString(_ string: String) {
        guard let url = URL(string: string) else { return }
        output?.didPrepareUrlRequest(URLRequest(url: url))
    }
    
    func didPerformNavigation(with url: URL) {
        storageService.store(url: url)
    }
}
