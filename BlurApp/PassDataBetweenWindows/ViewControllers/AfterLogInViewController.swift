//
//  AfterLogInViewController.swift
//  PassDataBetweenWindows
//
//  Created by Анас Бен Мустафа on 02.02.2021.
//  Copyright © 2021 Анас Бен Мустафа. All rights reserved.
//

import UIKit

class AfterLogInViewController: UIViewController {
    
    var LoginText: String?
    @IBOutlet weak var TextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = LoginText else { return }
        TextLabel.text = "Добро пожаловать, \(login)"
    }
    
    @IBAction func GoBackButtonAction(_ sender: UIButton) {
    }
    
}
