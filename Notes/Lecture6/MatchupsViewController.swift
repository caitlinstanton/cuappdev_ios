//
//  MatchupViewController.swift
//  Lecture 6
//
//  Created by Caitlin Stanton on 3/27/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var photo: UIImage?
    
    init(name: String, photo: UIImage?) {
        self.name = name
        self.photo = photo
    }
}

class Matchup {
    var person1: Person
    var person2: Person
    
    init(person1: Person, person2: Person) {
        self.person1 = person1
        self.person2 = person2
    }
    
}

class MatchupsViewController: UIViewController {

    var matchups = [Matchup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func fetchMatchups() {
        let api = API()
        api.fetchMatchups { (matchups: [Matchup]) in
            self.matchups = matchups
            self.setupView()
        }
    }
    
    func setupView() {
        
        if let firstMatchup = matchups.first {
            let testCard = CardView(frame: CGRect(x: 0, y: 0, width: 150, height: 200))
            testCard.setupCard(name: firstMatchup.person1.name, image: firstMatchup.person1.photo)
            testCard.center = view.center
            //testCard.delegate = self
            view.addSubview(testCard)
        }

    }
    
    func cardViewWasTouched(cardView: CardView) {
        UIView.animate(withDuration: 0.5: {
            cardView.center = CGPoint(x: cardView.center.x + 50, y: cardView.center.y)
            cardView.transform = CGAffineTransform(rotationAngle: M_PI / 2.0)
        }) {(success: Bool?) in 
    }

}
