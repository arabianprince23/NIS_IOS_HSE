//
//  TripViewController.swift
//  CarouselApp
//
//  Created by Бен Мустафа Анас on 31.01.2021.
//

import UIKit

class TripViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    internal var trips = [
        Destination(city: "Paris",
             country: "France", featuredImage: UIImage(named: "paris"),
             price: 2000, totalDays: 5, isLiked: false),
        Destination(city: "Sydney",
             country: "Australia", featuredImage: UIImage(named: "sydney"),
             price: 2500, totalDays: 8, isLiked: false),
        Destination(city: "Rome",
             country: "Italy", featuredImage: UIImage(named: "rome"),
             price: 800, totalDays: 3, isLiked: false),
        Destination(city: "Istanbul",
             country: "Turkey", featuredImage: UIImage(named: "istanbul"),
             price: 2200, totalDays: 10, isLiked: false),
        Destination(city: "London",
             country: "United Kingdom", featuredImage: UIImage(named: "london"),
             price: 3000, totalDays: 4, isLiked: false),
        Destination(city: "Santorini",
             country: "Greece", featuredImage: UIImage(named: "santorini"),
             price: 1800, totalDays: 7, isLiked: false),
        Destination(city: "New York",
             country: "United States", featuredImage: UIImage(named: "newyork"),
             price: 900, totalDays: 3, isLiked: false),
        Destination(city: "Kyoto",
             country: "Japan", featuredImage: UIImage(named: "kyoto"),
             price: 1000, totalDays: 5, isLiked: false)
                                        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.clear
        if UIScreen.main.bounds.size.height == 568.0 {
            let flowLayout = self.collectionView.collectionViewLayout as!
                UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: 250.0, height: 330.0)
        }
    }
}
