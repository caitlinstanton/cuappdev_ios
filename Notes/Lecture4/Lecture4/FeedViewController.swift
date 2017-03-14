//
//  FeedViewController.swift
//  Lecture4
//
//  Created by Caitlin Stanton on 3/13/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Product {
    
    var name: String
    var seller: String
    var image: UIImage?
    
    init(name: String, seller: String, image: UIImage?) {
        self.name = name
        self.seller = seller
        self.image = image
    }
    
}

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var products: [Product] = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        createProducts()
        
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func createProducts() {
        let airpods = Product(name: "Airpods", seller: "Apple", image: UIImage(named: "airpods"))
        let puppies = Product(name: "Puppies", seller: "ASPCA", image: #imageLiteral(resourceName: "puppies"))
        let couch = Product(name: "Couch", seller: "Dan", image: #imageLiteral(resourceName: "couch"))
        let switchConsole = Product(name: "Nintendo Switch", seller: "Nintendo", image: #imageLiteral(resourceName: "switch"))
        products = [airpods, puppies, couch, switchConsole]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let product = products[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.product = product
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}
