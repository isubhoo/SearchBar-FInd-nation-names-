//
//  ViewController.swift
//  TestTableView
//
//  Created by Subhajit Biswas on 23/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SwitchTableViewCell.nib(), forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 2 {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as! SwitchTableViewCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TextFieldTableViewCell.identifier,
                for: indexPath
            ) as! TextFieldTableViewCell
            return cell
            
        }
    }
}
