//
//  StorageService.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import Foundation

protocol StorageServiceProtocol: AnyObject {
    func store(url: URL)
    func fetchStoredUrls() -> [VisitedURL]
}

final class StorageService: StorageServiceProtocol {
    
    private var visitedUrls: [VisitedURL] = []
    
    private let path = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    )[0].appendingPathComponent("urls")
    
    init() {
        visitedUrls = fetchStoredUrls()
    }
    
    func store(url: URL) {
        let visitedUrl = VisitedURL(url: url)
        self.visitedUrls.append(visitedUrl)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: visitedUrls, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchStoredUrls() -> [VisitedURL] {
        guard
            let data = try? Data(contentsOf: path),
            let visitedUrls = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [VisitedURL]
        else {
            return []
        }
        self.visitedUrls = visitedUrls
        return visitedUrls
    }
}
