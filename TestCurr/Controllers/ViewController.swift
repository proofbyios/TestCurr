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
    
    var privatBankDataSource    = [Currency]()
    var nbuBankDataSource       = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title on screen
        self.navigationItem.title = "Курсы валют"
        
        // Registre cells in tableviews
        registre(cellNibName: String(describing: PrivatBankTableViewCell.self), in: privatBankTableView, for: PrivarBankCellIdentifier)
        registre(cellNibName: String(describing: NBUTableViewCell.self), in: NBUTableView, for: NBUCellIdentifier)
        
        // Get Privatbank currency
        ServiceManager.shared.getPrivatBankCurrency(forDay: "24.01.2019") { [unowned self] (result, error) in
            if let resultArray = result {
                self.privatBankDataSource = resultArray
                
                self.privatBankTableView.reloadData()
            }
        }
        
        // Get NBU currency
        ServiceManager.shared.getNBUBankCurrency(forDay: "20190125") { [unowned self] (result, error) in
            if let resultArray = result {
                self.nbuBankDataSource = resultArray
                
                self.NBUTableView.reloadData()
            }
        }
    }
    
    func registre(cellNibName: String, in tableView: UITableView, for reuseIdentifier: String) {
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }

}

// UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == privatBankTableView {
            return privatBankDataSource.count
        } else {
            return nbuBankDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == privatBankTableView {
            if privatBankDataSource.count == 0 {
                return UITableViewCell()
            }
            
            let currencyItem = privatBankDataSource[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PrivarBankCellIdentifier, for: indexPath) as! PrivatBankTableViewCell
            cell.currencySymbolLabel.text   = currencyItem.symbol
            cell.currencyBuyLabel.text      = String(format: "%.03f", currencyItem.buy ?? 0)
            cell.currencySellLabel.text     = String(format: "%.03f", currencyItem.sell ?? 0)
            
            return cell
        } else {
            if nbuBankDataSource.count == 0 {
                return UITableViewCell()
            }
            
            let currencyItem = nbuBankDataSource[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NBUCellIdentifier, for: indexPath) as! NBUTableViewCell
            cell.currencyNameLabel.text = currencyItem.name
            cell.currencyIncomeLabel.text = "1 \(currencyItem.symbol)"
            cell.currencyOutcomeLabel.text = String(format: "%.02f UAH", currencyItem.rate ?? 0)
            
            return cell
        }
    }
}

// UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == privatBankTableView {
            return 48.0
        }
        
        return 44.0
    }
}
