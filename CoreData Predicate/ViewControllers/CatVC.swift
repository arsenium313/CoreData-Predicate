//
//  ViewController.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 21.12.2022.
//

import UIKit

class CatVC: UIViewController {
    
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat6")
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = """
        1 - Color = Black
        2 - Age = \(10)
        3 - Breed = Сфинск
        4 - Hearts Rate = ❤️❤️❤️❤️❤️
        5 - Fun Rate = 😺😺😺😺😺
        6 - Lovelines Rate = 😻😻😻😻😻
        """
        return textView
    }()
 
    
    private let navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        let navTitle = UINavigationItem(title: "CatName")
        navBar.items = [navTitle]
        return navBar
    }()
    

    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
        
    }

    
    //MARK: - SetupUI
    private func setupUI(){
        setupNavBar()
        setupCatImageView()
        setupTextView()
    }
    
    private func setupNavBar(){
        self.view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

    private func setupCatImageView() {
        self.view.addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        
        catImageView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10).isActive = true
        catImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        catImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        catImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35).isActive = true
    }
    
    private func setupTextView(){
        self.view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

