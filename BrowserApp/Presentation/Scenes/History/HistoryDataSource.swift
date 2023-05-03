//
//  HistoryDataSource.swift
//  BrowserApp
//
//  Created by Zafar Ivaev on 03/05/23.
//

import UIKit

final class HistoryDataSource: NSObject, UITableViewDataSource {
    var items: [String] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.reuseIdentifer, for: indexPath) as? HistoryTableViewCell
        cell?.configure(with: items[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
