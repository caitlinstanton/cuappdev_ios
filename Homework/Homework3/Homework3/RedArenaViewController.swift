//
//  RedArenaViewController.swift
//  Homework3
//
//  Created by Caitlin Stanton on 3/9/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class RedArenaViewController: UIViewController {
    
    let SCREENSIZE = UIScreen.main.bounds
    var redSquareImageView: UIImageView!
    var sliderHeight: Int! = 1
    var sliderWidth: Int! = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addUIElements()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            redSquareImageView = UIImageView(frame: CGRect(x:0, y:0, width:sliderWidth, height:sliderHeight))
            redSquareImageView.center = location
            redSquareImageView.backgroundColor = UIColor.red
            view.addSubview(redSquareImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            redSquareImageView.center = location
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

