//
//  CatsTableVC.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 27.12.2022.
//

import UIKit

class CatsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(CatTableCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatTableCell
        cell.setupUI()
        cell.nameLabel.text = "Hello WOrld!"
    
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.show(ViewController(), sender: self)
//        navigationController?.pushViewController(ViewController(), animated: true)
        let vc = CatVC()
        present(vc, animated: true)
    }
}
