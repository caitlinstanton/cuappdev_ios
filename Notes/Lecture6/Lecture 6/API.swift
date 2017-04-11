//
//  API.swift
//  Lecture 6
//
//  Created by Caitlin Stanton on 3/27/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class API {
    
    let link = "https://raw.githubusercontent.com/dennisfedorko/test-json/master/matchups.json"
    
    func fetchMatchups(completion: @escaping ([Matchup]) -> ()) {
        
        guard let url = URL(string: link) else {
            //called if url can't be unwrapped
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            //once network fetch is complete, this code is called
            //may be asynchronous with URLSession call
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let unwrappedData = data {
                if let dictionary = self.getDictionaryFromData(data: unwrappedData) {
                    let matchups = self.getMatchupsFromJSON(json: dictionary)
                    completion(matchups)
                }
            }
            
        }
        
    }
    
    func getDictionaryFromData(data: Data) -> [String: Any]? {
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
            if let jsonDictionary = jsonObject as? [String: Any] {
                return jsonDictionary
            }
        }
        
        return nil
        
    }
    
    func getMatchupsFromJSON(json: [String: Any]) {
        if let matchupsJSONArray = json["matchups"] as? [[String: Any]] { //array of dictionaries [[String: Any]]
            for matchupsJSON in matchupsJSONArray {
                var person1: Person? = nil
                var person2: Person? = nil
                
                if let firstPersonJSON = matchupsJSON["first_person"] as? [String: Any] {
                    person1 = getPersonFromJSON(json: firstPersonJSON)
                }
                
                if let secondPersonJSON = matchupsJSON["first_person"] as? [String: Any] {
                    person2 = getPersonFromJSON(json: secondPersonJSON)
                }
                
                if let unwrappedPerson1 = person1, let unwrappedPerson2 = person2 {
                    let matchup = Matchup(person1: unwrappedPerson1, person2: unwrappedPerson2)
                    matchups.append(matchup)
                }
            }
        }
    }
    
    func getPersonFromJSON(json: [String: Any]) -> Person? {
        if let name = json["name"] as? String, let imageURLString = json["photo"] as? String {
            let person = Person(name: name, photo: getImageFromURLString(urlString: imageURLString))
            return person
        }
        
        return nil
    }
    
    func getImageFromURLString(urlString: String) -> UIImage? {
        let imageURL = URL(string: urlString)!
        if let imageData = try? Data(contentsOf: imageURL) {
            let image = UIImage(data: imageData)
            return image
        }
    }
    
}
