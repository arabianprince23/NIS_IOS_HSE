//
//  Author+CoreDataClass.swift
//
//
//  Created by Анас Бен Мустафа on 11/29/20.
//
//
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailLabel: UILabel!
    var detailItem: Commit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detail = self.detailItem {
            detailLabel.text = detail.message
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }
    }
    
    @objc func showAuthorCommits() {
    }
}
