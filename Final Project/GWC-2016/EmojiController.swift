//
//  EmojiController.swift
//  GWC-2016
//
//  Created by Joyce Van Drost on 7/20/16.
//  Copyright © 2016 Daily Burn. All rights reserved.
//

import UIKit

var mood: String = ""
var emotion: String = ""
var color: UIColor = UIColor.init(red: 100.0/255.0, green: 160.0/255.0, blue: 255.0/255.0, alpha: 1.0)
var happy: [String] = ["happy", "happiness", "joy", "YAY"]
var sad: [String] = ["sad", "lonely", "cheer up", "crying"]
var fear: [String] = ["fear", "scared", "ahh", "fear"]
var mad: [String] = ["mad", "angry", "grr", "frustrated"]
var neutral: [String] = ["bored", "boring", "yawn", "bored"]
var surprised: [String] = ["surprise", "whoa", "surprised", "speechless"]


func processEmotion (_ theEmotion: String){
    let random = Int(arc4random_uniform(4));
    switch(theEmotion){
    case "happiness":
        emotion = "happy"
        mood = happy[random]
    //color = UIColor.yellowColor()
    case "sadness":
        emotion = "sad"
        mood = sad[random]
    //color = UIColor.cyanColor()
    case "anger":
        emotion = "mad"
        mood = mad[random]
    //color = UIColor.redColor()
    case "surprise":
        emotion = "surprised"
        mood = surprised[random]
    //color = UIColor.orangeColor()
    case "fear":
        emotion = "scared"
        mood = fear[random]
    //color = UIColor.lightGrayColor()
    case "neutral":
        emotion = "neutral"
        mood = neutral[random]
    //color = UIColor.whiteColor()
    default:
        print("Invalid emotion")
    }
}


class EmojiController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var fearButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var madButton: UIButton!
    @IBOutlet weak var surprisedButton: UIButton!
    
    func getMood() -> String{
        return mood
    }
    
    func getColor() -> UIColor{
        return color
    }
    
    func getEmotion() -> String{
        return emotion
    }
    
    func happyButtonClicked(_ sender: UIButton){
        processEmotion("happiness")
    }
    func sadButtonClicked(_ sender: UIButton){
        processEmotion("sadness")
    }
    
    func madButtonClicked(_ sender: UIButton){
        processEmotion("anger")
    }
    
    func fearButtonClicked(_ sender: UIButton){
        processEmotion("fear")
    }
    
    func neutralButtonClicked(_ sender: UIButton){
        processEmotion("neutral")
    }
    
    func surprisedButtonClicked(_ sender: UIButton){
        processEmotion("surprise")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        happyButton.addTarget(self, action: #selector(EmojiController.happyButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        sadButton.addTarget(self, action: #selector(EmojiController.sadButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        fearButton.addTarget(self, action: #selector(EmojiController.fearButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        neutralButton.addTarget(self, action: #selector(EmojiController.neutralButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        surprisedButton.addTarget(self, action: #selector(EmojiController.surprisedButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        madButton.addTarget(self, action: #selector(EmojiController.madButtonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
