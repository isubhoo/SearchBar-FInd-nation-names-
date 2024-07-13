//
//  TextFieldTableViewCell.swift
//  TestTableView
//
//  Created by Subhajit Biswas on 23/05/24.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var searchBar: UITextField!
    
    static let identifier = "TextFieldTableViewCell"
    
    var timer: Timer?
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        searchBar.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.searchBar.placeholder = "Type something..."
        searchBar.addTarget(self, action: #selector(searchTextIfNeeded), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text ?? "")
        return true
    }
    
    @objc private func searchTextIfNeeded(_ sender: UITextField) {
//        print(sender.text ?? "")
        
        guard let searchedtext = sender.text, !searchedtext.isEmpty, sender.text?.count ?? 0 > 2 else {
            return
        }
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            self.callApi(with: searchedtext)
        })
    }
    
    private func callApi(with keyWord: String) {
        print("Searching: \(keyWord)")
    }
}
