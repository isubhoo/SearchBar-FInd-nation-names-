//
//  ViewController.swift
//  SearchBar TableView
//
//  Created by Subhajit Biswas on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    // IBoutlet
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    // Variable
    var searchList = [String]()
    var filteredSearchList = [String]()
    var searchTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Confirm Delegates
        tableView.delegate = self
        tableView.dataSource = self
//        searchTextField.delegate = self
        
        // register cell
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        // Configure View
        searchImageView.image = UIImage(named: "searchImage")
        searchTextField.placeholder = "Search Country names.."
        
        // Fetch Data
        fetchSearchContent()
        
        // Adding SearchBar Target
        searchTextField.addTarget(
            self,
            action: #selector(searchKeyWordIfNeeded(_ :)),
            for: .editingChanged
        )
    }
}


// TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Number Of Row (Counrt list Count)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If Filter array is not Empty use it's count
        if !filteredSearchList.isEmpty {
            return filteredSearchList.count
        }
        // Else use Search List count
        return searchList.count
    }
    
    // Reusing Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as! TableViewCell
        
        // If Filter array is Empty Make cell Using Search list else Use Filtered List
        !filteredSearchList.isEmpty ? (cell.textLabel?.text = filteredSearchList[indexPath.row]) : (cell.textLabel?.text = searchList[indexPath.row])
        
        return cell
    }
    
    // Determining Row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}


// UITextField (Search related tasks).
extension ViewController: UITextFieldDelegate {

    @objc func searchKeyWordIfNeeded(_ sender: UITextField) {
        // 1. Whenever get call make the Timer Invalidate
        searchTimer?.invalidate()
        
        // 2. Check if KeyWord is valid else return
        guard let searchKeyWord = sender.text else { return }
        
        // 3. Wait for 1 second then start Searching
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            // 4. Search unsing keyWord
            self.searchUsingKetWord(searchKeyWord)
        })
    }
    
    private func searchUsingKetWord(_ searchKeyWord: String) {
        // 5. Clear the Filtered data each time so that we can wefill it
        filteredSearchList = []
        
        // 6. Filtering names on the basice of KeyWord and appending in the Filter array
        for name in searchList {
            if name.lowercased().starts(with: searchKeyWord.lowercased()) {
                // 7. Append nam in the list
                filteredSearchList.append(name)
            }
        }
        
        // 8. Relode TableView
        tableView.reloadData()
    }
}


extension ViewController {
    private func fetchSearchContent() {
        // Appended Static Data
        searchList = [
            "United States", "China", "India", "Russia", "Brazil",
            "United Kingdom", "France", "Germany", "Japan", "Canada",
            "Australia", "South Korea", "Italy", "Spain", "Mexico",
            "Indonesia", "Netherlands", "Saudi Arabia", "Switzerland", "Argentina",
            "Turkey", "Poland", "Sweden", "Belgium", "Norway",
            "Iran", "Austria", "Thailand", "UAE (United Arab Emirates)", "Greece",
            "Denmark", "Malaysia", "Singapore", "Israel", "Egypt",
            "Ireland", "Portugal", "Czech Republic", "Romania", "Philippines",
            "Vietnam", "South Africa", "Finland", "New Zealand", "Hungary",
            "Kuwait", "Qatar", "Iraq", "Colombia", "Chile",
            "Algeria", "Nigeria", "Venezuela", "Bangladesh", "Pakistan",
            "Morocco", "Ukraine", "Peru", "Angola", "Sudan",
            "Kenya", "Ethiopia", "Tanzania", "Uzbekistan", "Myanmar (Burma)",
            "Afghanistan", "Ghana", "Mozambique", "Yemen", "Madagascar",
            "North Korea", "Cameroon", "Côte d'Ivoire (Ivory Coast)", "Niger", "Burkina Faso",
            "Mali", "Zambia", "Senegal", "Chad", "Zimbabwe",
            "Rwanda", "Guinea", "Benin", "Somalia", "Tunisia",
            "South Sudan", "Burundi", "Togo", "Sierra Leone", "Libya",
            "Central African Republic", "Republic of the Congo", "Liberia", "Mauritania",
            "Eritrea", "Namibia", "Botswana", "Gabon", "Lesotho",
            "Swaziland"
        ]
    }
}
