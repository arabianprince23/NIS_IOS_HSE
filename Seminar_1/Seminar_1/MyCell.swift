//
//  MyCell.swift
//  Seminar_1
//
//  Created by Анас Бен Мустафа on 10/30/20.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    let profileImageButton: UIButton = {
        let control = UIButton()
        control.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        control.layer.cornerRadius = 18
        control.clipsToBounds = false
        control.setImage(nil, for: .normal)
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let dateLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 16)
        control.textAlignment = .center
        control.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        control.text = "30.10.2020"
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let dayLebel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 19)
        control.textAlignment = .center
        control.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        control.text = "Friday"
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let distanceLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 14)
        control.textAlignment = .center
        control.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        control.text = "5km"
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.layer.cornerRadius = 20
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal error from MyCell")
    }
    
    private func addView() {
        addSubview(profileImageButton)
        addSubview(dateLabel)
        addSubview(dayLebel)
        addSubview(distanceLabel)
        
        profileImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 33).isActive = true
        profileImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        profileImageButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        dateLabel.centerYAnchor.constraint(equalTo: profileImageButton.centerYAnchor, constant: 0).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: profileImageButton.centerXAnchor, constant: 90).isActive = true
        
        dayLebel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor, constant: 0).isActive = true
        dayLebel.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor, constant: 110).isActive = true
        
        distanceLabel.centerYAnchor.constraint(equalTo: dayLebel.centerYAnchor, constant: 0).isActive = true
        distanceLabel.centerXAnchor.constraint(equalTo: dayLebel.centerXAnchor, constant: 105).isActive = true
        
        
    }
    
}
