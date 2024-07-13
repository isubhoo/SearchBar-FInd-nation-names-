//
//  TableViewCell.swift
//  SearchBar TableView
//
//  Created by Subhajit Biswas on 24/05/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Static Identifier
    static var identifier = "TableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
