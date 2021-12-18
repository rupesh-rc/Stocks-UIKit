//
//  SearchResultTableViewCell.swift
//  Stocks-UIKit
//
//  Created by Rupesh on 18/12/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    static let id = "SearchResultTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
