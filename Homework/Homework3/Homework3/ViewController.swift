//
//  ViewController.swift
//  Homework3
//
//  Created by Caitlin Stanton on 3/9/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let SCREENSIZE = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addUIElements()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addUIElements() {
        let redArenaButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-75, y:SCREENSIZE.height/2-50, width:150, height:30))
        redArenaButton.setTitle("Red Square Arena", for:UIControlState.normal)
        redArenaButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        redArenaButton.addTarget(self, action: #selector(showRedArenaPush), for: .touchUpInside)
        view.addSubview(redArenaButton)
        
        let blueArenaButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-75, y:SCREENSIZE.height/2, width:150, height:30))
        blueArenaButton.setTitle("Blue Square Arena", for: UIControlState.normal)
        blueArenaButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        blueArenaButton.addTarget(self, action: #selector(showBlueArenaModally), for: .touchUpInside)
        view.addSubview(blueArenaButton)
        
        let randomArenaButton = UIButton(frame: CGRect(x:SCREENSIZE.width/2-100, y:SCREENSIZE.height/2+50, width:200, height:30))
        randomArenaButton.setTitle("Random Square Arena", for: UIControlState.normal)
        randomArenaButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        randomArenaButton.addTarget(self, action: #selector(showRandomArenaPush), for: .touchUpInside)
        view.addSubview(randomArenaButton)
    }
    
    func showBlueArenaPush() {
        let blueArena = BlueArenaViewController()
        navigationController?.pushViewController(blueArena, animated: true)
        
    }
    
    func showRedArenaPush() {
        let redArena = RedArenaViewController()
        navigationController?.pushViewController(redArena, animated: true)
    }
    
    func showBlueArenaModally() {
        let blueArena = BlueArenaViewController()
        present(blueArena, animated: true, completion: nil)
    }
    
    func showRandomArenaPush() {
        let randomArena = RandomArenaViewController()
        navigationController?.pushViewController(randomArena, animated: true)
    }

}

