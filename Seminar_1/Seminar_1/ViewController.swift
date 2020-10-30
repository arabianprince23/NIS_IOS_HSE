//
//  ViewController.swift
//  Seminar_1
//
//  Created by Анас Бен Мустафа on 10/30/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var CollectionView: UICollectionView!
    
    let cellId = "Cell" // идентификатор ячейки
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpCollectionView()
    }
    
    func SetUpCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height / 10)
        
        CollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        CollectionView.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(CollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        
        return cell
    }


}

