//
//  NetworkAccessClass.swift
//  CurrencyLab
//
//  Created by Salma on 5/28/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import RxCocoa

class NetworkAccessClass: NetworkAccessDelegate {
    var homePresenterDelegate : HomePresenterDelegate
    let disposeBag = DisposeBag()
    init(homePresenterDelegate:HomePresenterDelegate) {
        self.homePresenterDelegate=homePresenterDelegate
    }
    func getCurrency() {
        RxAlamofire.requestJSON(.get,"https://api.exchangeratesapi.io/latest")
            .debug()
            .subscribe(onNext: { [weak self] (r, json) in
                if json is [String : AnyObject] {
                    do {
                        let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                        let currency = try! JSONDecoder().decode(Currency.self, from: data)
                    self?.homePresenterDelegate.sendCurrencies(currency:currency)
                        print(currency)
                    } catch let myJSONError {
                        print(myJSONError)
                    }
                    
                   
                }
            }).disposed(by: disposeBag)
    }
    
    
}
