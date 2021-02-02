//
//  StockModel.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/31/21.
//

import UIKit
import RealmSwift

/**
 Класс объекта акции, для сохранения в базу данных
 */
class StockModel: Object {
    @objc dynamic var stockSymbol : String = ""
    
    convenience init(stockSymbol: String) {
        self.init()
        self.stockSymbol = stockSymbol
    }
}
