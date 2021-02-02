//
//  Extensions.swift
//  CarouselApp
//
//  Created by Анас Бен Мустафа on 2/2/21.
//

import UIKit

extension TripViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension TripViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath) as! TripCollectionViewCell
        cell.cityLabel.text = trips[indexPath.row].city
        cell.countryLabel.text = trips[indexPath.row].country
        cell.imageView.image = trips[indexPath.row].featuredImage
        cell.priceLabel.text = "$\(String(trips[indexPath.row].price))"
        cell.totalDaysLabel.text = "\(trips[indexPath.row].totalDays) days"
        cell.isLiked = trips[indexPath.row].isLiked
        cell.layer.cornerRadius = 4.0
        cell.delegate = self
        return cell
    }
}

extension TripViewController: TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            trips[indexPath.row].isLiked = !trips[indexPath.row].isLiked
            cell.isLiked = trips[indexPath.row].isLiked
        }
    }
}
