//
//  NetworkServices.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 12/13/20.
//

import UIKit

extension ViewController {
    
    internal func requestQuote(for symbol: String) {
        
        let url = URL(string: "https://cloud.iexapis.com/v1/stock/\(symbol)/quote?token=\(token)")!
        
        // Для основных данных
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, (response as? HTTPURLResponse)?.statusCode == 200, let data = data
            else {
                print("Network error")
                return
            }
            
            self.parseQuote(data: data)
        }
        dataTask.resume()
    }
    
    private func parseQuote(data: Data) {
        do {
            
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            
            guard
                let json = jsonObject as? [String: Any],
                let companyName = json["companyName"] as? String,
                let companySymbol = json["symbol"] as? String,
                let currentPrice = json["latestPrice"] as? Double,
                let priceChange = json["change"] as? Double
            else {
                print("Invalid JSON format")
                return
            }
            
            DispatchQueue.main.async {
                self.displayStockInfo(companyName: companyName, companySymbol: companySymbol, currentPrice: currentPrice, priceChange: priceChange)
            }
        } catch {
            print("JSON parsin error : " + error.localizedDescription)
        }
    }
    
    private func displayStockInfo(companyName: String, companySymbol: String, currentPrice: Double, priceChange: Double) {

        self.activityIndicator.stopAnimating()
        self.companyNameLabel.text = companyName
        self.priceChangeLabel.text = "\(priceChange)"
        self.currentPriceLabel.text = "\(currentPrice)"
        self.symbolLabel.text = companySymbol
        setLogoImage(for: companySymbol)
        
        if (priceChange < 0) {
            self.priceChangeLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else {
            self.priceChangeLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
    
    internal func setLogoImage(for symbol: String) {
        
        let urlForImage = URL(string: "https://cloud.iexapis.com/v1/stock/\(symbol)/logo?token=\(token)")!
        
        let dataTask1 = URLSession.shared.dataTask(with: urlForImage) { (data, response, error) in
            
            guard error == nil, (response as? HTTPURLResponse)?.statusCode == 200, let data = data
            else {
                print("Network error")
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)
                
                guard
                    let json = jsonObject as? [String: Any],
                    let imageUrl = json["url"] as? String
                else {
                    print("Invalid JSON format")
                    return
                }
                
                DispatchQueue.main.async {
                     let url = URL(string: imageUrl)
                     let data = try? Data(contentsOf: url!)
                     self.companyLogoImage.image = UIImage(data: data!)
                }
            } catch {
                print("JSON parsin error : " + error.localizedDescription)
            }
        }
        dataTask1.resume()
    }
}
