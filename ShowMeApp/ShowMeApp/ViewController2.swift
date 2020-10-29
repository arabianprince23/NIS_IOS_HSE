//
//  ViewController2.swift
//  ShowMeApp
//
//  Created by Анас Бен Мустафа on 10/15/20.
//

import UIKit

class ViewController2: UIViewController {

    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let textToTF = text else { return }
        Label.text = textToTF
    }
    
    @IBOutlet weak var Label: UILabel!

}
