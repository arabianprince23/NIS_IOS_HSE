//
//  DataChangeExtension.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit

extension MainViewController {
    
    /**
     По полученным запросом данным обновляем интерфейс
     */
    func displayStockInfo(companyName: String, companySymbol: String, openPrice: Double, closePrice: Double, change: Double, changePercent: Double, marketCap: Int, peRatio: Double) {
        
        // Устанавливаем соответствующие значения для каждого лейбла
        self.activityIndicator.stopAnimating()
        self.companyNameLabel.text = companyName
        self.openPriceLabel.text = String(openPrice)
        self.closePriceLabel.text = String(closePrice)
        self.priceChangeLabel.text = "\(change) (\(NSString(format:"%.1f", changePercent * 100))%)"
        self.marketCapLabel.text = separatedNumber(marketCap: marketCap) + "$"
        self.p_e_Label.text = String(peRatio)
        self.symbolLabel.text = companySymbol
        setLogoImage(for: companySymbol)
        self.graphButton.isEnabled = true
        
        // Окрашиваем лейбл изменения цены в зависимости от того, упала она, выросла или не изменилась
        if (change < 0) {
            self.priceChangeLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else if (change > 0) {
            self.priceChangeLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            self.priceChangeLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    /**
     Для нормального представления стоимости компании на экране
     */
    func separatedNumber(marketCap: Int) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        
        return formatter.string(from: NSNumber(value: marketCap))!
    }
    
}

/**
 Расширение для возможности быстрого обращения к элементам строки в формате string[i]
 */
extension String {
    subscript(characterIndex: Int) -> Self {
        return String(self[index(startIndex, offsetBy: characterIndex)])
    }
}

