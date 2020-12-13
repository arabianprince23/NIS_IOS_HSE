//
//  ViewController.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 12/13/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var companyPickerView: UIPickerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var companyLogoImage: UIImageView!
    
    
    internal let token = "sk_fe10468fa08246d7b2a7470b21975b78"
    public let companies: [String: String] = ["Apple" : "AAPL",
                                               "Microsoft" : "MSFT",
                                               "Google" : "GOOG",
                                               "Amazon" : "AMZN"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companyPickerView.dataSource = self
        self.companyPickerView.delegate = self
        
        self.activityIndicator.hidesWhenStopped = true
        
        self.requestQuoteUpdate()
    }
    
}

