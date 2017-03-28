//
//  FeedTableViewCell.swift
//  Homework5
//
//  Created by Caitlin Stanton on 3/25/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate {
    func feedTableViewCellDidTapHeartButton(feedTableViewCell: FeedTableViewCell)
}

class FeedTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var firstNameLabel: UILabel!
    var lastNameLabel: UILabel!
    var phoneNumberLabel: UILabel!
    var emailLabel: UILabel!
    var delegate: FeedTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        profileImageView = UIImageView()
        firstNameLabel = UILabel()
        lastNameLabel = UILabel()
        phoneNumberLabel = UILabel()
        emailLabel = UILabel()
        
        addSubview(profileImageView)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(phoneNumberLabel)
        addSubview(emailLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        profileImageView.frame = CGRect(x: 10, y: 0, width: 50, height: 50)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2.0)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        profileImageView.clipsToBounds = true

        firstNameLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 15, y: profileImageView.frame.origin.y, width: 200, height: profileImageView.frame.height/2.0)
        firstNameLabel.textColor = UIColor.black
        
        lastNameLabel.frame = CGRect(x: firstNameLabel.frame.width + 5, y: profileImageView.frame.origin.y, width: 200, height: profileImageView.frame.height/2.0)
        lastNameLabel.textColor = UIColor.black
        
    }
    
    func setupCellWithPost(profileImage: UIImage, firstName: String, lastName: String) {
        profileImageView.image = profileImage
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
    }
    
}

