//
//  ViewController.swift
//  Project2
//
//  Created by Caitlin Stanton on 3/1/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Person {
    
    var name: String
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
    
    func description() -> String {
        return "Hi my name is \(name)"
    }
}

class ViewController: UIViewController {

    var anOptionalLabel: UILabel?
    var anImplicitlyWrappedLabel: UILabel!
    var aBool: Bool = true
    var intArray: [Int] = [Int]()
    var optionalFloat: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        addUIElements()
        
        anOptionalLabel = UILabel(frame: CGRect(x:50, y:225, width:40, height:10))
        anOptionalLabel?.backgroundColor = UIColor.blue
        
        anImplicitlyWrappedLabel = UILabel(frame: CGRect(x:50, y:275, width:40, height:10))
        anImplicitlyWrappedLabel.backgroundColor = UIColor.brown
        
        if let unwrappedOptionalLabel = anOptionalLabel {
            view.addSubview(unwrappedOptionalLabel)
        }
        view.addSubview(anImplicitlyWrappedLabel)
        
        initalizePerson()
        
    }
    
    func addUIElements() {
        let button = UIButton(frame: CGRect(x:50, y:100, width:100, height:100))
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(aFunctionTheButtonWillCallWhenTheUserTouchesUpInside), for: .touchUpInside)
        view.addSubview(button)
        
        let label = UILabel(frame: CGRect(x:100, y:300, width:120, height:50))
        label.text = "this is a label"
        view.addSubview(label)
        
        let textField = UITextField(frame: CGRect(x:250, y:100, width:100, height:50))
        textField.backgroundColor = UIColor.gray
        view.addSubview(textField)
        
        let textView = UITextView(frame: CGRect(x:225, y:175, width:100, height:100))
        textView.backgroundColor = UIColor.darkGray
        textView.isEditable = false
        view.addSubview(textView)
    }
    
    func aFunctionTheButtonWillCallWhenTheUserTouchesUpInside() {
        print("you touched the button!")
    }
    
    func initalizePerson() {
        let newPerson = Person(name: "Cartman", gender: "Unicorn")
        var myPerson:Person? = newPerson
        print(myPerson?.name)
        if let myPersonsName = myPerson?.name {
            anOptionalLabel?.text = myPersonsName
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

