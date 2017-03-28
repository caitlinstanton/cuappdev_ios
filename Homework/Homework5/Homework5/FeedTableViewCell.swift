//
//  FeedTableViewCell.swift
//  Homework5
//
//  Created by Caitlin Stanton on 3/25/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate {
    
}

class FeedTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var firstNameLabel: UILabel!
    var lastNameLabel: UILabel!
    var phoneNumberLabel: UILabel!
    var emailLabel: UILabel!
    var delegate: FeedTableViewCellDelegate?
    var phoneImage: UIImageView!
    var emailImage: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        profileImageView = UIImageView()
        firstNameLabel = UILabel()
        lastNameLabel = UILabel()
        phoneNumberLabel = UILabel()
        emailLabel = UILabel()
        
        phoneImage = UIImageView()
        phoneImage.image = #imageLiteral(resourceName: "Phone-50")
        
        emailImage = UIImageView()
        emailImage.image = #imageLiteral(resourceName: "Message-50")
        
        addSubview(profileImageView)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(phoneNumberLabel)
        addSubview(emailLabel)
        addSubview(emailImage)
        addSubview(phoneImage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        profileImageView.frame = CGRect(x: 10, y: 0, width: 75, height: 75)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2.0)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        profileImageView.clipsToBounds = true
        
        firstNameLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 15, y: profileImageView.frame.origin.y, width: 0, height: profileImageView.frame.height/2.0)
        firstNameLabel.sizeToFit()
        firstNameLabel.textColor = UIColor.black
        
        lastNameLabel.frame = CGRect(x: firstNameLabel.frame.origin.x + firstNameLabel.frame.width + 3, y: profileImageView.frame.origin.y, width: 0, height: profileImageView.frame.height/2.0)
        lastNameLabel.sizeToFit()
        lastNameLabel.textColor = UIColor.black
        
        phoneImage.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 15, y: firstNameLabel.frame.origin.y + firstNameLabel.frame.height + 4, width: profileImageView.frame.height/4.0, height: profileImageView.frame.height/4.0)
        
        phoneNumberLabel.frame = CGRect(x: phoneImage.frame.origin.x + phoneImage.frame.width + 3, y: firstNameLabel.frame.origin.y + firstNameLabel.frame.height + 4, width: 0, height: profileImageView.frame.height/4.0)
        phoneNumberLabel.sizeToFit()
        phoneNumberLabel.textColor = UIColor.darkGray
        
        emailImage.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 15, y: phoneNumberLabel.frame.origin.y + phoneNumberLabel.frame.height + 4, width: profileImageView.frame.height/4.0, height: profileImageView.frame.height/4.0)
        
        emailLabel.frame = CGRect(x: emailImage.frame.origin.x + emailImage.frame.width + 3, y: phoneNumberLabel.frame.origin.y + phoneNumberLabel.frame.height + 4, width: 0, height: profileImageView.frame.height/4.0)
        emailLabel.sizeToFit()
        emailLabel.textColor = UIColor.darkGray

        
    }
    
    func setupCellWithPost(profileImage: UIImage, firstName: String, lastName: String, phoneNumber: String, emailAddress: String) {
        profileImageView.image = profileImage
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        phoneNumberLabel.text = phoneNumber
        emailLabel.text = emailAddress
    }
    
}

