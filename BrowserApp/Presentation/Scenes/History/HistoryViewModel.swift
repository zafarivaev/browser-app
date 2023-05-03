//
//  HistoryViewModel.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import Foundation

protocol HistoryViewModelInput: AnyObject {
    func shouldFetchHistory()
}

protocol HistoryViewModelOutput: AnyObject {
    func didFetchHistory(urlStrings: [String])
}

final class HistoryViewModel: HistoryViewModelInput {
    
    weak var output: HistoryViewModelOutput?
    private let storageService: StorageServiceProtocol
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
    
    func shouldFetchHistory() {
        let visitedUrls = storageService.fetchStoredUrls().reversed()
        output?.didFetchHistory(urlStrings: visitedUrls.map { $0.url.absoluteString })
    }
}
