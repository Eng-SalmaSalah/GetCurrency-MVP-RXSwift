//
//  TableViewController.swift
//  CurrencyLab
//
//  Created by Salma on 5/27/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit
import RxAlamofire
import RxSwift
import RxCocoa

class HomeViewController: UIViewController,HomeViewDelegate {
    var currency : Currency?
    let disposeBag = DisposeBag()
    var countryList = Array<String>()
    var currencyList = Array<Double>()
    var homePresenterDelegate = HomePresenter()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenterDelegate.setDelegate(homeViewDelegate: self)
        homePresenterDelegate.getCurrency()

    }
    
    func viewCurrencies(countryList:Array<String>,currencyList:Array<Double>){
        self.countryList=countryList
        self.currencyList=currencyList
        
        Observable.of(countryList).bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: TableViewCell.self)){(row,element,cell) in
                cell.countryOutlet?.text=element
            cell.currencyOutlet?.text = String(currencyList[row])
            }
            .disposed(by: disposeBag)
       
    }

}
