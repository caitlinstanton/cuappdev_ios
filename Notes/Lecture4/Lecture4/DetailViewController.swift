//
//  DetailViewController.swift
//  Lecture4
//
//  Created by Caitlin Stanton on 3/13/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var product: Product!
    var imageView: UIImageView!
    var sellerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addUIElements()
    }
    
    func addUIElements() {
        imageView = UIImageView(frame: CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height/2.0))
        imageView.image = product.image
        
        sellerLabel = UILabel(frame: CGRect(x:0, y:imageView.frame.height+imageView.frame.origin.y+10, width:view.frame.width/2.0, height:30))
        sellerLabel.center = CGPoint(x:view.center.x, y: sellerLabel.center.y)
        sellerLabel.textAlignment = .center
        sellerLabel.text = product.seller
        
        view.addSubview(imageView)
        view.addSubview(sellerLabel)
    }

}
