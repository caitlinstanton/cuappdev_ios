//
//  FeedTableViewCell.swift
//  Lecture5
//
//  Created by Caitlin Stanton on 3/20/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate {
    func feedTableViewCellDidTapHeartButton(feedTableViewCell: FeedTableViewCell)
}

class FeedTableViewCell: UITableViewCell {

    var profileImageView: UIImageView!
    var creatorLabel: UILabel!
    var songNameLabel: UILabel!
    var heartButton: UIButton!
    var delegate: FeedTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .gray
        
        profileImageView = UIImageView()
        creatorLabel = UILabel()
        songNameLabel = UILabel()
        heartButton = UIButton()
        heartButton.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        
        addSubview(profileImageView)
        addSubview(creatorLabel)
        addSubview(songNameLabel)
        addSubview(heartButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func didTapHeartButton() {
        
    }
    
    override func layoutSubviews() {
        profileImageView.frame = CGRect(x: 10, y: 0, width: 50, height: 50)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2.0)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        profileImageView.clipsToBounds = true
        
        creatorLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 5, y: profileImageView.frame.origin.y, width: 200, height: profileImageView.frame.height/2.0)
        
        songNameLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 5, y: creatorLabel.frame.origin.y + creatorLabel.frame.height, width: 200, height: profileImageView.frame.height/2.0)
        
        heartButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        heartButton.center = CGPoint(x: frame.width - 50, y: frame.height/2.0)
    }
    
    func setupCellWithPost(profileImage: UIImage, creatorName: String, songName: String, isLiked: Bool) {
        profileImageView.image = profileImage
        creatorLabel.text = creatorName
        songNameLabel.text = songName
        
        if isLiked {
            heartButton.setImage(#imageLiteral(resourceName: "heart_red"), for: .normal)
        } else {
            heartButton.setImage(#imageLiteral(resourceName: "heart_white"), for: .normal)
        }
        
    }

}
