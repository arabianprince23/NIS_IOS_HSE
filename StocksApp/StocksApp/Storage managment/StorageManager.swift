//
//  StorageManager.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/31/21.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    /**
     Сохранение в базу данных
     */
    static func saveObject(_ stock: StockModel) {
        try! realm.write {
            realm.add(stock)
        }
    }
    
}
