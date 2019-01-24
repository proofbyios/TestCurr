//
//  ViewController.swift
//  TestCurr
//
//  Created by Alex on 1/23/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var privatBankTableView: UITableView!
    @IBOutlet weak var NBUTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registre cells in tableviews
        registre(cellNibName: String(describing: PrivatBankTableViewCell.self), in: privatBankTableView, for: PrivarBankCellIdentifier)
        registre(cellNibName: String(describing: NBUTableViewCell.self), in: NBUTableView, for: NBUCellIdentifier)
        
        
    }
    
    func registre(cellNibName: String, in tableView: UITableView, for reuseIdentifier: String) {
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }

}

// UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == privatBankTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: PrivarBankCellIdentifier, for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NBUCellIdentifier, for: indexPath)
            
            return cell
        }
    }
    
    
}
