//
//  ComposeViewController.swift
//  SocialApp
//
//  Created by Анас Бен Мустафа on 11/29/20.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var postActivity: UIActivityIndicatorView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var tweetContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func dismissView(_ sender: Any) {
    }
    
    @IBAction func postToTwitter(_ sender: Any) {
    }
    
}
