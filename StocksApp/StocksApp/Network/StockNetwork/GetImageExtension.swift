//
//  GetImageExtension.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit

extension MainViewController {
    
    /**
     Метод для загрузки и обработки изображения-логотипа компании
     */
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
                print("JSON parsing error : " + error.localizedDescription)
            }
        }
        
        dataTask1.resume()
    }
}
