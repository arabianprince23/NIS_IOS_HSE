//
//  PickerViewExtensions.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit

extension MainViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.companies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.companies[row].stockSymbol
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentTicker = self.companies[row].stockSymbol
        requestQuoteUpdate()
    }
    
    // Пока происходит обновление данных
    internal func requestQuoteUpdate() {
        self.activityIndicator.startAnimating()
        self.companyNameLabel.text = "Loading..."
        self.openPriceLabel.text = "Loading..."
        self.closePriceLabel.text = "Loading..."
        self.priceChangeLabel.text = "Loading..."
        self.marketCapLabel.text = "Loading..."
        self.p_e_Label.text = "Loading..."
        self.symbolLabel.text = "Loading..."
        self.companyLogoImage.image = UIImage(named: "loading_Image")
        
        if (!(companies.count == 0)) {
            let selectedRow = self.companyPickerView.selectedRow(inComponent: 0)
            let selectedSymbol = self.companies[selectedRow]
            self.requestQuote(for: selectedSymbol.stockSymbol)
        }
    }
}
