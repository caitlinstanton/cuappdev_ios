//
//  EditViewController.swift
//  Homework4
//
//  Created by Caitlin Stanton on 3/16/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var editText: UITextField!
    var submitButton: UIButton!
    
    var interest: String!
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        editText = UITextField(frame: CGRect(x:30, y:100, width:view.frame.width-60, height:30))
        editText.text = interest
        editText.layer.borderColor = UIColor.darkGray.cgColor
        editText.layer.borderWidth = 1
        editText.layer.cornerRadius = 4
        
        submitButton = UIButton(frame: CGRect(x:view.frame.width/2-50, y:150, width:100, height:30))
        submitButton.backgroundColor = UIColor.blue
        submitButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        submitButton.setTitle("Submit", for: UIControlState.normal)
        submitButton.addTarget(self, action: #selector(updateInterest), for: .touchUpInside)
        
        view.addSubview(editText)
        view.addSubview(submitButton)
    }
    
    func updateInterest() {
        var interestIndex: Int = friend.interests.index(of:interest)!
        friend.interests[interestIndex] = editText.text!
        print(friend.interests[interestIndex])
        interest = editText.text
        print("new interest is \(interest)")
    }
    
}
