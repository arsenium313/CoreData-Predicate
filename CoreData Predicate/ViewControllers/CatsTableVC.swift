//
//  CatsTableVC.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 27.12.2022.
//

import UIKit

protocol PassInfoAboutCat: AnyObject {
    func passInfo(name: String, picture: String, color: String, age: Int, heartRate: Int, funRate: Int, lovelinessRate: Int)
}


class CatsTableVC: UITableViewController {

    private var cats: [Cat] = []
    weak var delegate: PassInfoAboutCat?
    
    private let addCatButton: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(addCat))
        return item
    }()
    
    private let catPredicateButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "PR", style: .plain, target: nil, action: #selector(predicateCat))
        
        return item
    }()
    
    // MARK: - View Life Circe
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CatTableCell.self, forCellReuseIdentifier: "Cell")
        self.cats = DataManager.shared.fetchAllCats()
        
        addCatButton.target = self
        catPredicateButton.target = self
        navigationItem.rightBarButtonItems = [addCatButton, catPredicateButton]
        navigationItem.title = "Amount of cats = \(cats.count)"
    }
    
    
    //MARK: - @objc
    @objc private func addCat() {
        let cat = DataManager.shared.createCat()
        cats.append(cat)
        navigationItem.title = "Amount of cats = \(cats.count)"
        tableView.reloadData()
    }

    @objc private func predicateCat(){
        let predicateVC = PredicateVC()
        navigationController?.pushViewController(predicateVC, animated: true)
    }
    
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cat = cats[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatTableCell
        cell.setupUI()
        cell.nameLabel.text = cat.name
        cell.catImageView.image = UIImage(named: cat.picture)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CatVC()
        self.delegate = vc
        
        let cat = cats[indexPath.row]
        delegate?.passInfo(name: cat.name, picture: cat.picture, color: cat.color, age: Int(cat.age), heartRate: Int(cat.heartRate), funRate: Int(cat.funRate), lovelinessRate: Int(cat.lovelinessRate))
        
        present(vc, animated: true)
    }
}
