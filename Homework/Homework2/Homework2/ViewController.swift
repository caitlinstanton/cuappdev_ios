//
//  ViewController.swift
//  Homework2
//
//  Created by Caitlin Stanton on 3/1/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let SCREENSIZE = UIScreen.main.bounds
    var nameTextField: UITextField!
    var yearTextField: UITextField!
    var majorTextField: UITextField!
    var gpaTextField: UITextField!
    var studentList: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        addUIElements()
        
    }
    
    func addUIElements() {
        let nameLabel = UILabel(frame: CGRect(x:20, y:50, width:50, height: 20))
        nameLabel.text = "Name:"
        view.addSubview(nameLabel)
        
        nameTextField = UITextField(frame: CGRect(x:100, y:50, width:SCREENSIZE.width-150, height:20))
        nameTextField.backgroundColor = UIColor.gray
        view.addSubview(nameTextField)
        
        let yearLabel = UILabel(frame: CGRect(x:20, y:75, width: 50, height:20))
        yearLabel.text = "Year:"
        view.addSubview(yearLabel)
        
        yearTextField = UITextField(frame: CGRect(x:100, y:75, width: SCREENSIZE.width-150, height:20))
        yearTextField.backgroundColor = UIColor.gray
        view.addSubview(yearTextField)
        
        let majorLabel = UILabel(frame: CGRect(x:20, y:100, width:50, height:20))
        majorLabel.text = "Major:"
        view.addSubview(majorLabel)
        
        majorTextField = UITextField(frame: CGRect(x:100, y:100, width: SCREENSIZE.width-150, height: 20))
        majorTextField.backgroundColor = UIColor.gray
        view.addSubview(majorTextField)
        
        let gpaLabel = UILabel(frame: CGRect(x:20, y:125, width:50, height: 20))
        gpaLabel.text = "GPA:"
        view.addSubview(gpaLabel)
        
        gpaTextField = UITextField(frame: CGRect(x:100, y:125, width:SCREENSIZE.width-150, height:20))
        gpaTextField.backgroundColor = UIColor.gray
        view.addSubview(gpaTextField)
        
        let addButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-75, y:200, width:150, height:30))
        addButton.setTitle("Add Student", for: UIControlState.normal)
        addButton.backgroundColor = UIColor.blue
        addButton.addTarget(self, action: #selector(addStudentToList), for: .touchUpInside)
        view.addSubview(addButton)
        
        let studentLabel = UILabel(frame: CGRect(x:SCREENSIZE.width/2-100, y:250, width:200, height:30))
        studentLabel.text = "Student Information"
        studentLabel.textAlignment = NSTextAlignment.center
        view.addSubview(studentLabel)
        
        studentList = UITextView(frame: CGRect(x:20, y:300, width: SCREENSIZE.width-40, height: 250))
        studentList.backgroundColor = UIColor.purple
        view.addSubview(studentList)
    }
    
    func addStudentToList() {
        let name = nameTextField?.text
        let major = majorTextField?.text
        let gpa = gpaTextField?.text
        let resultString = "\(name) is majoring in \(major) with a \(gpa)"
        studentList.text = studentList.text + "\n" + resultString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

