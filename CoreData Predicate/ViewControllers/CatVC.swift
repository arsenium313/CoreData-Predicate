//
//  ViewController.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 21.12.2022.
//

import UIKit

class CatVC: UIViewController {
    
    private let catImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private let aboutCatTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 25)
        return tv
    }()
 
    private let navBar: UINavigationBar = {
        let nb = UINavigationBar()
        let nt = UINavigationItem()
        nb.items = [nt]
        return nb
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
        self.view.addSubview(aboutCatTextView)
        aboutCatTextView.translatesAutoresizingMaskIntoConstraints = false
        
        aboutCatTextView.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20).isActive = true
        aboutCatTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        aboutCatTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        aboutCatTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


//MARK: - PassInfoAboutCat
extension CatVC: PassInfoAboutCat {
    func passInfo(name: String, picture: String, color: String, age: Int, heartRate: Int, funRate: Int, lovelinessRate: Int) {
        let heartEmoji = "♥️"
        let funEmoji = "😺"
        let lovelinessEmoji = "😻"
        
        self.navBar.items![0].title = name
        self.catImageView.image = UIImage(named: picture)
        self.aboutCatTextView.text = """
        Color = \(color)
        Age = \(age) years
        Hearts Rate = \(emojiConverter(heartEmoji, rate: heartRate))
        Fun Rate = \(emojiConverter(funEmoji, rate: funRate))
        Lovelines Rate = \(emojiConverter(lovelinessEmoji, rate: lovelinessRate))
        """
    }
    
    private func emojiConverter(_ emoji: String, rate: Int) -> String{
        var rateString = ""
        for _ in 1...rate {
            rateString.append(emoji)
        }
        return rateString
    }
    
}
