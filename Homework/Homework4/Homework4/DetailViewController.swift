//
//  DetailViewController.swift
//  Homework4
//
//  Created by Caitlin Stanton on 3/16/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friend: Friend!
    var tableView: UITableView!
    var interests: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "\(friend.name)'s Interests"
        
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        
        refresh()
        
        view.addSubview(tableView)
    }
    
    func refresh() {
        for i in friend.interests {
            interests.append(i)
        }
        print("refresh")
        let editViewController = EditViewController()
        print("\(editViewController.updatedBool)")

        self.tableView.reloadData()
        //self.refresher.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        let interest = interests[indexPath.row]
        cell.textLabel?.text = interest
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let interest = interests[indexPath.row]
        let editViewController = EditViewController()
        editViewController.interest = interest
        editViewController.friend = friend
        navigationController?.pushViewController(editViewController, animated: true)
    }

    
}
