//
//  ViewController.swift
//  ShowMeApp
//
//  Created by Анас Бен Мустафа on 10/15/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var UIButton: UIButton!
    
    @IBAction func UIButtonAction(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc2 = segue.destination as? ViewController2 else { return }
        vc2.text = TextField.text
    }
    
}

