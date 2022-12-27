//
//  CatTableCell.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 27.12.2022.
//

import UIKit

class CatTableCell: UITableViewCell {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    let catImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cat1")
        return view
    }()
    
    //MARK: - SetupUI
    func setupUI(){
        setupNameLabel()
    }
    
    private func setupNameLabel(){
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
    }
    
    
}
