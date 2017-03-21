//
//  FeedTableViewCell.swift
//  Lecture5
//
//  Created by Caitlin Stanton on 3/20/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var profileImageView: UIImageView!
    var creatorLabel: UILabel!
    var songNameLabel: UILabel!
    var heartButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView = UIImageView()
        profileImageView.backgroundColor = .black
        creatorLabel = UILabel()
        creatorLabel.backgroundColor = .gray
        songNameLabel = UILabel()
        songNameLabel.backgroundColor = .red
        heartButton = UIButton()
        heartButton.backgroundColor = .blue
        
        addSubview(profileImageView)
        addSubview(creatorLabel)
        addSubview(songNameLabel)
        addSubview(heartButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        profileImageView.frame = CGRect(x: 10, y: 0, width: 50, height: 50)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2.0)
        
        creatorLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 5, y: profileImageView.frame.origin.y, width: 200, height: profileImageView.frame.height/2.0)
        
        songNameLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 5, y: creatorLabel.frame.origin.y + creatorLabel.frame.height, width: 200, height: profileImageView.frame.height/2.0)
        
        heartButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        heartButton.center = CGPoint(x: frame.width - 50, y: frame.height/2.0)
    }

}
