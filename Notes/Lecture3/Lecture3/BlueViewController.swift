//
//  BlueViewController.swift
//  Lecture3
//
//  Created by Caitlin Stanton on 3/6/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.center = view.center
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(showRedViewControllerPush), for: .touchUpInside)
        view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    
    func showRedViewControllerModal() {
        //pull up RedViewController with modal transition, by pulling the view up from the bottom
        let redViewController = RedViewController()
        present(redViewController, animated: true) {
            //code executed after redViewController is presented
            print("good job")
        }
    }
    
    func showRedViewControllerPush() {
        let redViewController = RedViewController()
        navigationController?.pushViewController(redViewController, animated: true)
    }
    
}
