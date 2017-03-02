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
    var errorLabel: UILabel!
    var errorString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        addUIElements()
        
    }
    
    func addUIElements() {
        
        let nameLabel = UILabel(frame: CGRect(x:20, y:50, width:50, height: 25))
        nameLabel.text = "Name:"
        view.addSubview(nameLabel)
        
        nameTextField = UITextField(frame: CGRect(x:100, y:50, width:SCREENSIZE.width-150, height:25))
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        nameTextField.layer.cornerRadius = 4.0
        nameTextField.layer.borderWidth = 2.0
        view.addSubview(nameTextField)
        
        let yearLabel = UILabel(frame: CGRect(x:20, y:80, width: 50, height:25))
        yearLabel.text = "Year:"
        view.addSubview(yearLabel)
        
        yearTextField = UITextField(frame: CGRect(x:100, y:80, width: SCREENSIZE.width-150, height:25))
        yearTextField.layer.borderWidth = 1
        yearTextField.layer.borderColor = UIColor.gray.cgColor
        yearTextField.layer.cornerRadius = 4.0
        yearTextField.layer.borderWidth = 2.0
        view.addSubview(yearTextField)
        
        let majorLabel = UILabel(frame: CGRect(x:20, y:110, width:50, height:25))
        majorLabel.text = "Major:"
        view.addSubview(majorLabel)
        
        majorTextField = UITextField(frame: CGRect(x:100, y:110, width: SCREENSIZE.width-150, height: 25))
        majorTextField.layer.borderWidth = 1
        majorTextField.layer.borderColor = UIColor.gray.cgColor
        majorTextField.layer.cornerRadius = 4.0
        majorTextField.layer.borderWidth = 2.0
        view.addSubview(majorTextField)
        
        let gpaLabel = UILabel(frame: CGRect(x:20, y:140, width:50, height: 25))
        gpaLabel.text = "GPA:"
        view.addSubview(gpaLabel)
        
        gpaTextField = UITextField(frame: CGRect(x:100, y:140, width:SCREENSIZE.width-150, height:25))
        gpaTextField.layer.borderWidth = 1
        gpaTextField.layer.borderColor = UIColor.gray.cgColor
        gpaTextField.layer.cornerRadius = 4.0
        gpaTextField.layer.borderWidth = 2.0
        view.addSubview(gpaTextField)
        
        let addButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-75, y:200, width:150, height:30))
        addButton.setTitle("Add Student", for: UIControlState.normal)
        addButton.backgroundColor = UIColor.blue
        addButton.addTarget(self, action: #selector(addStudentToList), for: .touchUpInside)
        view.addSubview(addButton)
        
        errorLabel = UILabel(frame: CGRect(x:20, y:240, width: SCREENSIZE.width-20, height:30))
        errorLabel.textColor = UIColor.red
        errorLabel.text = ""
        view.addSubview(errorLabel)
        
        let studentLabel = UILabel(frame: CGRect(x:SCREENSIZE.width/2-100, y:300, width:200, height:30))
        studentLabel.text = "Student Information"
        studentLabel.textAlignment = NSTextAlignment.center
        view.addSubview(studentLabel)
        
        studentList = UITextView(frame: CGRect(x:20, y:350, width: SCREENSIZE.width-40, height: 0))
        studentList.isScrollEnabled = false
        view.addSubview(studentList)
    }
    
    func addStudentToList() {
        let name = nameTextField?.text
        let major = majorTextField?.text
        let gpa = gpaTextField?.text
        let year = yearTextField?.text
        /*
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","x","y","z"]
        let nums = ["0","1","2","3","4","5","6","7","8","9"]
        
        var errorString: String = ""
        
        for i in (name?.characters)! {
            if alphabet.contains(String(i)) == false {
                errorString = errorString + "\nName input is not valid"
            }
        }
        
        if ((year?.characters.count)! > 4) {
            errorString = errorString + "\nYear input is not valid"
        }
        
        for i in (year?.characters)! {
            if nums.contains(String(i)) == false {
                errorString = errorString + "\nYear input is not valid"
            }
        }
        
        print(errorString.characters.count)
        
        let valid: Bool = (errorString.characters.count) <= 1
        
        print(valid)
 
 
        let valid: Bool = areInputsValid()
        errorLabel.text = ""
        errorString = ""

        print(errorString)
        if valid == true {

            errorString = ""
            errorLabel.text = errorString
            */
        let resultString = "\(name!) is majoring in \(major!) with a \(gpa!)"
        studentList.text = studentList.text + "\n" + resultString
        nameTextField.text = ""
        majorTextField.text = ""
        gpaTextField.text = ""
        yearTextField.text = ""
        
        let fixedWidth = studentList.frame.size.width
        studentList.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = studentList.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = studentList.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        studentList.frame = newFrame
            /*
        } else {
            let errorString = "ERROR: One of the inputs is invalid"
            errorLabel.text = errorLabel.text! + errorString
            nameTextField.text = ""
            majorTextField.text = ""
            gpaTextField.text = ""
            yearTextField.text = ""
            
            let fixedWidth = errorLabel.frame.size.width
            errorLabel.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            let newSize = errorLabel.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            var newFrame = errorLabel.frame
            newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            errorLabel.frame = newFrame
        }*/
    }
    
    func areInputsValid() -> Bool {
        errorString = ""
        
        let name = nameTextField?.text
        //let major = majorTextField?.text
        //let gpa = gpaTextField?.text
        let year = yearTextField?.text
        
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","x","y","z"]
        let nums = ["0","1","2","3","4","5","6","7","8","9"]
        
        
        for i in (name?.characters)! {
            if alphabet.contains(String(i)) == false {
                errorString = errorString + "\nName input is not valid"
            }
        }
        
        if ((year?.characters.count)! > 4) {
            errorString = errorString + "\nYear input is not valid"
        }
        
        for i in (year?.characters)! {
            if nums.contains(String(i)) == false {
                errorString = errorString + "\nYear input is not valid"
            }
        }
        
        nameTextField.text = ""
        majorTextField.text = ""
        gpaTextField.text = ""
        yearTextField.text = ""
        
        let valid: Bool = (errorString.characters.count) <= 1
        return valid
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

