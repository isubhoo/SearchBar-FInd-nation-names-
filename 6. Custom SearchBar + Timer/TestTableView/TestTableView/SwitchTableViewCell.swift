//
//  SwitchTableViewCell.swift
//  TestTableView
//
//  Created by Subhajit Biswas on 23/05/24.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static var identifier = "SwitchTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureSwitchButttons()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureSwitchButttons() {
        let sideSwitch = UISwitch()
        sideSwitch.isOn = true
        sideSwitch.addTarget(self, action: #selector(didTappOnSwitch), for: .valueChanged)
        self.accessoryView = sideSwitch
    }
    
    @objc private func didTappOnSwitch(_ sender: UISwitch) {
        sender.isOn ? print("On") : print("off")
    }
}
