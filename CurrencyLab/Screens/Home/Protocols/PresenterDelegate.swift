//
//  PresenterDelegate.swift
//  CurrencyLab
//
//  Created by Salma on 5/28/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import Foundation
protocol HomePresenterDelegate{
    func setDelegate (homeViewDelegate : HomeViewDelegate)
    func getCurrency ()
    func sendCurrencies(currency:Currency)
}
