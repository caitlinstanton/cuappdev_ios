//
//  TouchesViewController.swift
//  Lecture3
//
//  Created by Caitlin Stanton on 3/6/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class TouchesViewController: UIViewController {

    var dogeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            dogeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            dogeImageView.center = location
            dogeImageView.image = UIImage(named: "doge")
            view.addSubview(dogeImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            dogeImageView.center = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dogeImageView.removeFromSuperview()
    }
    
    
}
