//
//  ViewController.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit
import RealmSwift
import SwiftUI

class MainViewController: UIViewController {

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    @IBOutlet weak var closePriceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var p_e_Label: UILabel!
    @IBOutlet weak var companyPickerView: UIPickerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var companyLogoImage: UIImageView!
    
    @IBOutlet weak var graphButton: UIButton!
    
    internal let token = "pk_f8c7f9b8c9f94b00b77a08efba9feae1"
    
    // Стартовый набор акций
    public var companies: [StockModel] = [StockModel(stockSymbol: "ZM"), StockModel(stockSymbol: "TSLA"), StockModel(stockSymbol: "AAPL"), StockModel(stockSymbol: "NVDA"), StockModel(stockSymbol: "FB")]
    
    // Выгруженный массив из базы данных
    var results: Results<StockModel>!
    
    // Текущий тикер
    var currentTicker: String = "ZM"
    
    // Массив с ценами на акцию за всё время - используется в графике
    var mass: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Проверка наличия подключения к интернету при запуске приложения
        if (!isConnectedToNetwork()) {
            errorAlert(title: "Ошибка подключения", message: "Подключение к интернету отсутсвует или слишком слабое. Проверьте подключение и повторите попытку позже.", actionTitle: "Готово")
            infoIfErrorCatched()
        }
        
        // Выгружаем данные из БД и заполняем ими массив тикеров
        results = realm.objects(StockModel.self)
        for result in results {
            companies.append(StockModel(stockSymbol: result.stockSymbol))
        }
        
        self.companyPickerView.dataSource = self
        self.companyPickerView.delegate = self
        self.activityIndicator.hidesWhenStopped = true
        self.requestQuoteUpdate()
    }
    
    // Обратный сегвей (при нажатии кнопки добавления на AddStockViewController)
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard let addStockVC = segue.source as? AddStockViewController else { return }
        
        let symbol = addStockVC.symbol
        companies.append(symbol)
        StorageManager.saveObject(symbol)
        
        DispatchQueue.main.async {
            self.companyPickerView.reloadAllComponents()
        }
    }
    
    /**
     Показываем view с графиком по нажатию на кнопку
     */
    @IBAction func graphButtonTapped(_ sender: UIButton) {
        print(currentTicker)
        
        self.mass = []
        
        graphInfoRequest(for: currentTicker) { (array) in
            DispatchQueue.main.async { [self] in
                let graphView = GraphView(ticker: currentTicker, points: array)
                present(UIHostingController(rootView: graphView), animated: true)
            }
        }
    }
}

