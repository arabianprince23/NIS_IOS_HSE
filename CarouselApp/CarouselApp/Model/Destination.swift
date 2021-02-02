//
//  Trip.swift
//  CarouselApp
//
//  Created by Бен Мустафа Анас on 31.01.2021.
//

import UIKit

struct Destination {
    var city = ""
    var country = ""
    var featuredImage: UIImage?
    var price:Int = 0
    var totalDays: Int = 0
    var isLiked = false
    
    init(city: String,
         country: String, featuredImage: UIImage!,
         price: Int, totalDays: Int, isLiked: Bool) {
        self.city = city
        self.country = country
        self.featuredImage = featuredImage
        self.price = price
        self.totalDays = totalDays
        self.isLiked = isLiked
    }
}
