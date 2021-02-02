//
//  NetworkServices.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit

extension MainViewController {
    
    /**
     Метод отправки запроса на сервер
     */
    func requestQuote(for symbol: String) {
        
        guard let url = URL(string: "https://cloud.iexapis.com/v1/stock/\(symbol)/quote?token=\(token)")
        else {
            errorAlert(title: "Ошибка URL-запроса.", message: "Проверьте правильнось введённого тикера. Примеры тикеров: TSLA, AMZN, ZM", actionTitle: "Готово")
            infoIfErrorCatched()
            return()
        }
        
        // Запрос по юрл
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, (response as? HTTPURLResponse)?.statusCode == 200, let data = data
            else {
                
                // Если не все данные были получены, либо запрос ошибочный
                DispatchQueue.main.async {
                    self.infoIfErrorCatched()
                    self.errorAlert(title: "Ошибка запроса", message: "При попытке запроса по данному тикеру произошла ошибка. Проверьте корректность введённого тикера или попробуйте позже.", actionTitle: "Готово")
                }
                
                return
            }
            
            self.parseQuote(data: data)
        }
        
        dataTask.resume()
    }
    
    func parseQuote(data: Data) {
        
        do {
            
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            
            guard let json = jsonObject as? [String: Any] else { return } // Проверка на получение каких-либо данных
            
            guard
                let companyName = json["companyName"] as? String,
                let companySymbol = json["symbol"] as? String,
                let openPrice = json["open"] as? Double,
                let closePrice = json["close"] as? Double,
                let change = json["change"] as? Double,
                let changePercent = json["changePercent"] as? Double,
                let marketCap = json["marketCap"] as? Int,
                let peRatio = json["peRatio"] as? Double
            else {
                
                print("Invalid JSON format")
                
                // Если не все данные были получены, либо запрос ошибочный
                DispatchQueue.main.async {
                    self.infoIfErrorCatched()
                    self.errorAlert(title: "Ошибка запроса", message: "При попытке запроса по данному тикеру произошла ошибка. Проверьте корректность введённого тикера или попробуйте позже.", actionTitle: "Готово")
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self.displayStockInfo(companyName: companyName, companySymbol: companySymbol, openPrice: openPrice, closePrice: closePrice, change: change, changePercent: changePercent, marketCap: marketCap, peRatio: peRatio)
            }   
        } catch {
            print("JSON parsing error : " + error.localizedDescription)
        }
    }
}
