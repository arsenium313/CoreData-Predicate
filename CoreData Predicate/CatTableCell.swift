//
//  CatTableCell.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 27.12.2022.
//

import UIKit

class CatTableCell: UITableViewCell {

    var catName: String = "EmptyValue" {
        willSet { nameLabel.text = newValue }
    }
    
    var catImage: UIImage? {
        willSet { catImageView.image = newValue }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    private let catImageView = UIImageView()
    
    
    //MARK: - SetupUI
    func setupUI(){
        setupNameLabel()
        setupCatImageView()
    }
    
    private func setupNameLabel() {
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.28)
        ])
    }
    
    private func setupCatImageView() {
        self.contentView.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            catImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            catImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            catImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            catImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9)
        ])
    }
    
    
}
