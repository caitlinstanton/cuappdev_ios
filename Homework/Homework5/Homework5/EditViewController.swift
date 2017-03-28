//
//  EditViewController.swift
//  Homework5
//
//  Created by Caitlin Stanton on 3/27/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var firstNameEdit: UITextField!
    var lastNameEdit: UITextField!
    var phoneNumberEdit: UITextField!
    var emailEdit: UITextField!
    var submitButton: UIButton!
    
    var interest: String!
    var contact: Contact!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = contact.firstName + " " + contact.lastName
        
        let profileImageView = UIImageView(frame: CGRect(x: view.frame.width/2.0 - 50, y: 150, width: 100, height: 100))
        profileImageView.image = contact.image
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: 150)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        profileImageView.clipsToBounds = true
        
        let firstNameLabel = UILabel(frame: CGRect(x: 15, y: profileImageView.frame.origin.y + profileImageView.frame.height + 10, width: 50, height: 30))
        firstNameLabel.text = "First"
        firstNameLabel.textColor = UIColor.black
        
        firstNameEdit = UITextField(frame: CGRect(x:75, y:profileImageView.frame.origin.y + profileImageView.frame.height + 10, width:view.frame.width - 120, height:30))
        firstNameEdit.text = contact.firstName
        firstNameEdit.layer.borderColor = UIColor.darkGray.cgColor
        firstNameEdit.layer.borderWidth = 1
        firstNameEdit.layer.cornerRadius = 4
        
        let lastNameLabel = UILabel(frame: CGRect(x: firstNameLabel.frame.origin.x, y: firstNameLabel.frame.origin.y + firstNameLabel.frame.height + 7, width: 50, height: 30))
        lastNameLabel.text = "Last"
        lastNameLabel.textColor = UIColor.black
        
        lastNameEdit = UITextField(frame: CGRect(x:75, y:firstNameLabel.frame.origin.y + firstNameLabel.frame.height + 7, width:view.frame.width - 120, height:30))
        lastNameEdit.text = contact.lastName
        lastNameEdit.layer.borderColor = UIColor.darkGray.cgColor
        lastNameEdit.layer.borderWidth = 1
        lastNameEdit.layer.cornerRadius = 4
        
        let phoneLabel = UILabel(frame: CGRect(x: firstNameLabel.frame.origin.x, y: lastNameLabel.frame.origin.y + lastNameLabel.frame.height + 7, width: 50, height: 30))
        phoneLabel.text = "Phone"
        phoneLabel.textColor = UIColor.black
        
        phoneNumberEdit = UITextField(frame: CGRect(x: 75, y: lastNameLabel.frame.origin.y + lastNameLabel.frame.height + 7, width: view.frame.width - 120, height: 30))
        phoneNumberEdit.text = contact.phone
        phoneNumberEdit.layer.borderColor = UIColor.darkGray.cgColor
        phoneNumberEdit.layer.borderWidth = 1
        phoneNumberEdit.layer.cornerRadius = 4
        
        let emailLabel = UILabel(frame: CGRect(x: firstNameLabel.frame.origin.x, y: phoneLabel.frame.origin.y + phoneLabel.frame.height + 7, width: 50, height: 30))
        emailLabel.text = "Email"
        emailLabel.textColor = UIColor.black
        
        emailEdit = UITextField(frame: CGRect(x:75, y: phoneLabel.frame.origin.y + phoneLabel.frame.height + 7, width: view.frame.width - 120, height: 30))
        emailEdit.text = contact.email
        emailEdit.layer.borderColor = UIColor.darkGray.cgColor
        emailEdit.layer.borderWidth = 1
        emailEdit.layer.cornerRadius = 4
        
        submitButton = UIButton(frame: CGRect(x:view.frame.width/2-50, y:emailLabel.frame.origin.y + emailLabel.frame.height + 15, width:100, height:30))
        submitButton.backgroundColor = UIColor.blue
        submitButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        submitButton.setTitle("Submit", for: UIControlState.normal)
        submitButton.addTarget(self, action: #selector(updateContact), for: .touchUpInside)
        
        view.addSubview(profileImageView)
        view.addSubview(firstNameLabel)
        view.addSubview(lastNameLabel)
        view.addSubview(phoneLabel)
        view.addSubview(emailLabel)
        view.addSubview(firstNameEdit)
        view.addSubview(lastNameEdit)
        view.addSubview(phoneNumberEdit)
        view.addSubview(emailEdit)
        view.addSubview(submitButton)
    }
    
    func updateContact() {
        contact.firstName = firstNameEdit.text!
        contact.lastName = lastNameEdit.text!
        contact.phone = phoneNumberEdit.text!
        contact.email = emailEdit.text!
        tableView.reloadData()
    }

}
