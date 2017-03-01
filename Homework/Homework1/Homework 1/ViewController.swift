//
//  ViewController.swift
//  Homework 1
//
//  Created by Caitlin Stanton on 2/17/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func revealMessage(_ sender: UIButton) {
        label.text = "Here's the message! :D"
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

