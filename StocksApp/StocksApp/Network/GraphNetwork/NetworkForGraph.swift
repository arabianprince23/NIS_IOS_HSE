//
//  NetworkForGraph.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/31/21.
//

import Foundation

extension MainViewController {
    
    /**
     Функция получения массива данных о цене акции за последние 3 месяца (взят другой api)
     */
    func graphInfoRequest(for stock: String, completion: @escaping ([Double]) -> Void) {
        
        let url = URL(string: "https://financialmodelingprep.com/api/v3/historical-price-full/\(stock)?from=2020-11-12&to=2021-05-02&apikey=0228951c1933337dda941cd8d526b595")
        
        var request = URLRequest(url: url!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
            
            guard let json = jsonObject as? [String: Any] else {
                print("json упал")
                return } // Проверка на получение каких-либо данных
            
            print(json["symbol"])
            
            for elem in (json["historical"] as! [[String : Any]]) {
                
                guard
                    let date = elem["date"] as? String,
                    let openPrice = elem["open"] as? Double,
                    let closePrice = elem["close"] as? Double
                else {
                    print("openClose failed")
                    return
                }
                
                print(date)
                
                self.mass.append(openPrice)
                self.mass.append(closePrice)
                
            }
            
            self.mass.reverse()
            
            completion(self.mass)
        }.resume()
    }
}
