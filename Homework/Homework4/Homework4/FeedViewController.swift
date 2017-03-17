//
//  FeedViewController.swift
//  Homework4
//
//  Created by Caitlin Stanton on 3/16/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Friend {
    
    var name: String
    var age: Int
    var interests: [String]
    
    init(name: String, age: Int, interests: [String]) {
        self.name = name
        self.age = age
        self.interests = interests
    }
    
}

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var friends: [Friend] = [Friend]()
    
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
        let rahul = Friend(name: "Rahul", age: 19, interests: ["trees","Cavs","SciOly","Annika","Costco","dad sweaters","Katy Perry"])
        let alex = Friend(name: "Alex", age: 17, interests: ["Zeta Psi","basketball"])
        let nick = Friend(name: "Nick", age: 18, interests: ["Badgers","alt-j","lin alg"])
        let annika = Friend(name: "Annika", age: 19, interests: ["Phi Mu","50 shades","snapchat"])
        let rupal = Friend(name: "Rupal", age: 19, interests: ["jogging","orange is the new black","Phi Mu"])
        friends = [rahul, alex, nick, annika, rupal]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.name) is \(friend.age) years old"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let friend = friends[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.friend = friend
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
