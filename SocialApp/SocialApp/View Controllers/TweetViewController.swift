//
//  TweetViewController.swift
//  SocialApp
//
//  Created by Анас Бен Мустафа on 11/29/20.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetAuthorAvatar: UIImageView!
    
    @IBOutlet weak var tweetAuthorName: UILabel!
    
    @IBOutlet weak var tweetText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissView(_ sender: Any) {
    }

}
