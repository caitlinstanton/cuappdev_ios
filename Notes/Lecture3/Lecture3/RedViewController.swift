//
//  RedViewController.swift
//  Lecture3
//
//  Created by Caitlin Stanton on 3/6/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.center = view.center
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(dismissViewControllerPop), for: .touchUpInside)
        view.addSubview(button)

    }
    
    func dismissViewControllerModal() {
        dismiss(animated: true, completion: nil)
    }
    
    func dismissViewControllerPop() {
        navigationController?.popViewController(animated: true)
    }

}
