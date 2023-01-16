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
    
    private lazy var addCatButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCatBarButton))
    private lazy var catPredicateButton = UIBarButtonItem(title: "PR", style: .plain, target: self, action: #selector(predicateCatBarButton))
 
    private let predicateAlertController = UIAlertController(title: "Predicate", message: "Choose predicate option", preferredStyle: .actionSheet)
    
    
    // MARK: - View Life Circe
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CatTableCell.self, forCellReuseIdentifier: "Cell")
        self.cats = DataManager.shared.fetchCats()
        
        self.navigationItem.rightBarButtonItems = [addCatButton, catPredicateButton]
        reloadTitle()
        setupAlertController()
    }
    
    
    //MARK: - @objc
    @objc private func addCatBarButton() {
        let cat = DataManager.shared.createRandomCat()
        cats.append(cat)
        reloadTitle()
        tableView.reloadData()
    }

    @objc private func predicateCatBarButton(){
        self.present(predicateAlertController, animated: true)
    }
    
    //MARK: - Setup AlertControllert
    private func setupAlertController() {
        predicateAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        predicateAlertController.addAction(UIAlertAction(title: "Without sort, predicate", style: .default,handler: { _ in
            self.cats =  DataManager.shared.fetchCats()
            self.reloadTitle()
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Name A-Z", style: .default,handler: { _ in
            let sort = NSSortDescriptor(key: "name", ascending: true)
            self.cats =  DataManager.shared.fetchCats(sort: [sort])
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Name Z-A", style: .default,handler: { _ in
            let sort = NSSortDescriptor(key: "name", ascending: false)
            self.cats =  DataManager.shared.fetchCats(sort: [sort])
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Age 1-15", style: .default,handler: { _ in
            let sort = NSSortDescriptor(key: "age", ascending: true)
            self.cats =  DataManager.shared.fetchCats(sort: [sort])
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Age 15-1", style: .default,handler: { _ in
            let sort = NSSortDescriptor(key: "age", ascending: false)
            self.cats =  DataManager.shared.fetchCats(sort: [sort])
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Name A-Z, Age 1-15", style: .default,handler: { _ in
            let sortName = NSSortDescriptor(key: "name", ascending: true)
            let sortAge = NSSortDescriptor(key: "age", ascending: true)
            self.cats =  DataManager.shared.fetchCats(sort: [sortName, sortAge])
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "Name Begins with 'A'", style: .default,handler: { _ in
            let predicate = NSPredicate(format: "name BEGINSWITH[c] 'a'")
            self.cats =  DataManager.shared.fetchCats(predicate: predicate)
            self.reloadTitle()
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "❤️😺😻 rate >= 3", style: .default,handler: { _ in
            let predicate = NSCompoundPredicate(type: .and, subpredicates: [
            NSPredicate(format: "heartRate >= %@", "\(3)"),
            NSPredicate(format: "funRate >= %@", "\(3)"),
            NSPredicate(format: "lovelinessRate >= %@", "\(3)")
            ])
            self.cats =  DataManager.shared.fetchCats(predicate: predicate)
            self.reloadTitle()
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "❤️😺😻 rate < 3", style: .default,handler: { _ in
            let predicate = NSCompoundPredicate(type: .and, subpredicates: [
            NSPredicate(format: "heartRate < %@", "\(3)"),
            NSPredicate(format: "funRate < %@", "\(3)"),
            NSPredicate(format: "lovelinessRate < %@", "\(3)")
            ])
            self.cats =  DataManager.shared.fetchCats(predicate: predicate)
            self.reloadTitle()
            self.tableView.reloadData()
        }))
        predicateAlertController.addAction(UIAlertAction(title: "❤️ rate == 1", style: .default,handler: { _ in
            let predicate = NSPredicate(format: "heartRate == %@","\(1)")
            self.cats =  DataManager.shared.fetchCats(predicate: predicate)
            self.reloadTitle()
            self.tableView.reloadData()
        }))
    }
    
    private func reloadTitle(){
        self.navigationItem.title = "Amount of cats = \(cats.count)"
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
        delegate?.passInfo(name: cat.name, picture: cat.picture, color: cat.color, age: Int(cat.age),
                           heartRate: Int(cat.heartRate), funRate: Int(cat.funRate), lovelinessRate: Int(cat.lovelinessRate))
        
        present(vc, animated: true)
    }
}
