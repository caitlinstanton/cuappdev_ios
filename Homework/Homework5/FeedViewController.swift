//
//  FeedViewController.swift
//  Homework5
//
//  Created by Caitlin Stanton on 3/25/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Contact {
    
    var firstName: String
    var lastName: String
    var image: UIImage?
    var phone: String
    var email: String
    
    init(firstName: String, lastName: String, image: UIImage?, phone: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        if image != nil {
            self.image = image
        } else {
            self.image = #imageLiteral(resourceName: "User Groups-50")
        }
        self.phone = phone
        self.email = email
    }
    
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedTableViewCellDelegate {
    
    var tableView: UITableView!
    var addContact: UIButton!
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        
        addContact = UIButton(frame: CGRect(x: view.frame.origin.x, y: self.navigationController!.navigationBar.frame.origin.y + self.navigationController!.navigationBar.frame.height, width: view.frame.width, height: 60))
        addContact.setTitle("Add Contact", for: UIControlState.normal)
        addContact.backgroundColor = UIColor.blue
        addContact.setTitleColor(UIColor.white, for: UIControlState.normal)
        addContact.addTarget(self, action: #selector(addNewContact), for: .touchUpInside)
        
        tableView = UITableView(frame: CGRect(x: 0, y: addContact.frame.origin.y + addContact.frame.height, width: view.frame.width, height: view.frame.height - (addContact.frame.origin.y + addContact.frame.height)))
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "Reuse")
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(addContact)
        view.addSubview(tableView)
        
        fetchPosts()
    }
    
    func addNewContact() {
        let newContact = Contact(firstName: "", lastName: "", image: nil, phone: "", email: "")
        contacts.append(newContact)
        let editViewController = EditViewController()
        editViewController.contact = newContact
        editViewController.tableView = tableView
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    func fetchPosts() {
        
        let steph = Contact(firstName: "Steph", lastName: "Mark", image: #imageLiteral(resourceName: "steph"), phone: "111-111-1111", email: "steph@marky.com")
        let anah = Contact(firstName: "Anah", lastName: "Lewi", image: #imageLiteral(resourceName: "anah"), phone: "222-222-2222", email: "blackgurlmagic@lewi.com")
        let liv = Contact(firstName: "Liv", lastName: "Johnston", image: #imageLiteral(resourceName: "liv"), phone: "333-333-3333", email: "olivia@lesserivy.org")
        let zee = Contact(firstName: "Zee", lastName: "Rashed", image: #imageLiteral(resourceName: "zee"), phone: "444-444-4444", email: "dinglefart@aol.com")
        let natasha = Contact(firstName: "Natasha", lastName: "Lane", image: #imageLiteral(resourceName: "natasha"), phone: "212-555-5555", email: "biffle@lane.edu")
        let emilyR = Contact(firstName: "Emily", lastName: "Redler", image: #imageLiteral(resourceName: "emilyr"), phone: "646-777-7777", email: "defhacksinc@legal.com")
        let emilyX = Contact(firstName: "Emily", lastName: "Xu", image: #imageLiteral(resourceName: "emilyx"), phone: "347-888-8888", email: "ummmwhat@lol.z")
        let michaela = Contact(firstName: "Michaela", lastName: "Papallo", image: #imageLiteral(resourceName: "michaela"), phone: "845-999-9999", email: "michaela@lesserivy.org")
        let sabrina = Contact(firstName: "Sabrina", lastName: "Bergsten", image: #imageLiteral(resourceName: "sabrina"), phone: "607-123-456", email: "gwc@vicepres.jokes")
        let danielle = Contact(firstName: "Danielle", lastName: "Letayf", image: #imageLiteral(resourceName: "danielle"), phone: "718-909-323", email: "5ever@momager.com")
        
        contacts = [steph,anah,liv,zee,natasha,emilyR,emilyX,michaela,sabrina,danielle]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? FeedTableViewCell {
            let contact = contacts[indexPath.row]
            cell.setupCellWithPost(profileImage: contact.image!, firstName: contact.firstName, lastName: contact.lastName, phoneNumber: contact.phone, emailAddress: contact.email)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let editViewController = EditViewController()
        editViewController.contact = contacts[indexPath.row]
        editViewController.tableView = tableView
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}
