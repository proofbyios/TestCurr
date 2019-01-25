//
//  ServiceManager.swift
//  TestCurr
//
//  Created by Alex on 1/25/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ServiceManager: NSObject {
    
    static let shared = ServiceManager()
    
    func getPrivatBankCurrency(forDay: String, complition: @escaping ([Currency]?, Error?) -> ()) {
        guard let requestURL = URL(string: pivatBankStringURL + forDay) else { return }
        
        var resultArray = [Currency]()
        
        Alamofire.request(requestURL).responseJSON { response in
            if let jsonObject = response.result.value {
                let json = JSON(jsonObject)

                for (_, value):(String, JSON) in json[exchangeRate] {
                    if value[currency].stringValue.count == 0 {
                        continue
                    }
                    
                    let currencyItem = Currency.init(symbol: value[currency].stringValue,
                                                 sell: value[saleRateNB].doubleValue,
                                                 buy: value[purchaseRateNB].doubleValue,
                                                 rate: nil,
                                                 name: nil)
                    
                    resultArray.append(currencyItem)
                }
                
                complition(resultArray, nil)
            } else {
                complition(nil, response.error)
            }
        }
    }
    
    func getNBUBankCurrency(forDay: String, complition: @escaping ([Currency]?, Error?) -> ()) {
        guard let requestURL = URL(string: nbuStringURL + forDay) else { return }
        
        var resultArray = [Currency]()
        
        Alamofire.request(requestURL).responseJSON { response in
            if let jsonObject = response.result.value {
                let json = JSON(jsonObject)
                
                for (_, value):(String, JSON) in json {
                    let currencyItem = Currency.init(symbol: value[currencyCC].stringValue,
                                                     sell: nil,
                                                     buy: nil,
                                                     rate: value[currencyRate].doubleValue,
                                                     name: value[currencyName].stringValue)
                    
                    resultArray.append(currencyItem)
                }
                
                complition(resultArray, nil)
            } else {
                complition(nil, response.error)
            }
        }
    }
}
