//
//  VisitedURL.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import Foundation

class VisitedURL: NSObject, NSCoding {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    required convenience init?(coder: NSCoder) {
        guard let url = coder.decodeObject(forKey: "url") as? URL else { return nil }
        self.init(url: url)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(url, forKey: "url")
    }
}
