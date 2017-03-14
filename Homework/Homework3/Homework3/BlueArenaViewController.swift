//
//  BlueArenaViewController.swift
//  Homework3
//
//  Created by Caitlin Stanton on 3/9/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class BlueArenaViewController: UIViewController {

    let SCREENSIZE = UIScreen.main.bounds
    var blueSquareImageView: UIImageView!
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
            blueSquareImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: sliderWidth, height: sliderHeight))
            blueSquareImageView.center = location
            blueSquareImageView.backgroundColor = UIColor.blue
            view.addSubview(blueSquareImageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            blueSquareImageView.center = location
        }
    }
    
    func addUIElements() {
        let returnButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-50, y:20, width:100, height:30))
        returnButton.setTitle("Go Back", for: UIControlState.normal)
        returnButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        returnButton.layer.borderColor = UIColor.gray.cgColor
        returnButton.layer.cornerRadius = 4.0
        returnButton.layer.borderWidth = 2.0
        returnButton.addTarget(self, action: #selector(dismissBlueArenaModally), for: .touchUpInside)
        view.addSubview(returnButton)
        
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
    
    func dismissBlueArenaModally() {
        dismiss(animated: true, completion: nil)
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
