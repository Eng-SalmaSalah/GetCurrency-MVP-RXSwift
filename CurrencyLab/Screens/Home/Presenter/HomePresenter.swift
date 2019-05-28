//
//  HomePresenter.swift
//  CurrencyLab
//
//  Created by Salma on 5/28/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
class HomePresenter: HomePresenterDelegate {

    var homeViewDelegate : HomeViewDelegate?
    var networkAccessDelegate : NetworkAccessDelegate?
    
    init() {
         networkAccessDelegate=NetworkAccessClass(homePresenterDelegate: self)
    }
    func setDelegate(homeViewDelegate: HomeViewDelegate) {
        self.homeViewDelegate = homeViewDelegate
       
    }
    func getCurrency() {
        networkAccessDelegate?.getCurrency()
    }
    func sendCurrencies(currency:Currency) {
        var currencyList = Array<Double>()
        var countryList = Array<String>()
        let currencyDict = currency.rates
        
        for item in currencyDict{
            countryList.append(item.key)
            currencyList.append(item.value)
        }
        
        homeViewDelegate?.viewCurrencies(countryList: countryList, currencyList: currencyList)
    }
    
    
    
}
