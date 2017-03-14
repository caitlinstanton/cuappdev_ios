//
//  RandomArenaViewController.swift
//  Homework3
//
//  Created by Caitlin Stanton on 3/9/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class RandomArenaViewController: UIViewController {

    let SCREENSIZE = UIScreen.main.bounds
    var randomSquareImageView: UIImageView!
    var sliderHeight: Int! = 1
    var sliderWidth: Int! = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let red:CGFloat = CGFloat(arc4random_uniform(255))/255.0
        let green:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))/255.0
        let blue:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))/255.0
    
        view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        addUIElements()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            randomSquareImageView = UIImageView(frame: CGRect(x:0, y:0, width:sliderWidth, height:sliderHeight))
            randomSquareImageView.center = location
            let red:CGFloat = CGFloat(arc4random_uniform(255))/255.0
            let green:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))/255.0
            let blue:CGFloat = CGFloat(arc4random_uniform(UInt32(255.0)))/255.0
            randomSquareImageView.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
            view.addSubview(randomSquareImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            randomSquareImageView.center = location
        }
    }
    
    func addUIElements() {
        let widthLabel = UILabel(frame:CGRect(x:20, y:70, width:50, height:20))
        widthLabel.text = "Width"
        view.addSubview(widthLabel)
        
        let widthSlider = UISlider(frame:CGRect(x:80, y:70, width:SCREENSIZE.width-90, height:20))
        widthSlider.minimumValue = 1
        widthSlider.maximumValue = 100
        widthSlider.isContinuous = true
        widthSlider.tintColor = UIColor.green
        widthSlider.addTarget(self, action: #selector(updateSliderWidth(_:)), for: .valueChanged)
        self.view.addSubview(widthSlider)
        
        let heightLabel = UILabel(frame: CGRect(x:20, y:120, width:70, height:20))
        heightLabel.text = "Height"
        view.addSubview(heightLabel)
        
        let heightSlider = UISlider(frame:CGRect(x:80, y:120, width:SCREENSIZE.width-90, height:20))
        heightSlider.minimumValue = 1
        heightSlider.maximumValue = 100
        heightSlider.isContinuous = true
        heightSlider.tintColor = UIColor.green
        heightSlider.addTarget(self, action: #selector(updateSliderHeight(_:)), for: .valueChanged)
        self.view.addSubview(heightSlider)
    }
    
    func updateSliderHeight(_ sender:UISlider!) {
        print("Slider value changed")
        
        // Use this code below only if you want UISlider to snap to values step by step
        sliderHeight = Int(sender.value)
        
        print("Slider step value \(Int(sender.value))")
    }
    
    func updateSliderWidth(_ sender:UISlider!) {
        print("Slider value changed")
        
        // Use this code below only if you want UISlider to snap to values step by step
        sliderWidth = Int(sender.value)
        
        print("Slider step value \(Int(sender.value))")
    }


}
