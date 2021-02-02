//
//  AddStockTableViewController.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/30/21.
//

import UIKit

class AddStockViewController: UIViewController {
    
    var symbol = StockModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Пока тикер не введён, не даем доступ к кнопке сохранения
        addButton.isEnabled = false
        
        // Отслеживает изменения в текстфилде
        stockTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stockTextField: UITextField!
    
    
    @IBAction func addStockButtonTapped(_ sender: UIButton) {
        symbol.stockSymbol = stockTextField.text!
    }
    
    // В этом методе описываем доступность кнопки Save
    @objc private func textFieldChanged() {
        if (stockTextField.text?.isEmpty == true) {
            addButton.isEnabled = false
        } else {
            addButton.isEnabled = true
        }
    }
}
