//
//  ErrorsHandling.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/31/21.
//

import UIKit

extension MainViewController {
    
    /**
     Алёрт при ошибке запроса по данному тикеру
     */
    func errorAlert(title: String, message: String, actionTitle: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ошибка запроса", message: "При попытке запроса по данному тикеру произошла ошибка. Проверьте корректность введённого тикера или попробуйте позже.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Готово", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    /**
     В случае возникновения ошибки запроса по тикеру, данные делаем как неизвестные
     */
    func infoIfErrorCatched() {
        DispatchQueue.main.async {
            self.displayStockInfo(companyName: "?", companySymbol: "?", openPrice: 0.0, closePrice: 0.0, change: 0.0, changePercent: 0.0, marketCap: 0, peRatio: 0.0)
            self.companyLogoImage.image = UIImage(named: "no_Image")
            self.graphButton.isEnabled = false
        }
    }
}
