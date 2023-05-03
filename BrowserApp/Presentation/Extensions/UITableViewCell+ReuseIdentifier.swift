//
//  UITableViewCell+ReuseIdentifier.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifer: String {
        return String(describing: self)
    }
}
