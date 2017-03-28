//
//  CardView.swift
//  Lecture 6
//
//  Created by Caitlin Stanton on 3/27/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

protocol CardViewDelegate {
    func cardViewWasTouched(cardView: CardView)
}

class CardView: UIView {

    var imageView: UIImageView!
    var nameLabel: UILabel!
    var delegate: CardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .lightGray
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.width))
        imageView.backgroundColor = .black
        nameLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.height, width: frame.width, height: frame.height - imageView.frame.height))
        nameLabel.textAlignment = .center
        
        
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCard(name: String, image: UIImage?) {
        imageView.image = image
        nameLabel.text = name
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.cardViewWasTouched(cardView: self)
    }
    
}
