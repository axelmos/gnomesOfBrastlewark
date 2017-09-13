//
//  GBGnome.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBGnome: NSObject {
    
    var id: Int
    var name: String
    var thumbnail: String
    var age: Int
    var gWeight: Float
    var gHeight: Float
    var hairColor: String
    var arrProfs: [String]
    var arrFriends: [String]
    

    func getHairColor(strColor: String) -> UIColor {
        var color = UIColor()
        
        switch strColor.lowercased() {
            case "pink":
                color = UIColor.init(colorLiteralRed: 255.0/255.0, green: 21.0/255.0, blue: 142.0/255.0, alpha: 1.0)
            case "red":
                color = UIColor.red
            case "green":
                color = UIColor.green
            case "black":
                color = UIColor.black
            case "gray":
                color = UIColor.gray
            default:
                color = UIColor.white
        }
        
        return color
    }
    
    
    init(dict: JSONDictionary) {
        guard let
            id = dict["id"] as? Int,
            let name = dict["name"] as? String,
            let thumbnail = dict["thumbnail"] as? String,
            let age = dict["age"] as? Int,
            let gWeight = dict["weight"] as? Float,
            let gHeight = dict["height"] as? Float,
            let hairColor = dict["hair_color"] as? String,
            let arrProfs = dict["professions"] as? [String],
            let arrFriends = dict["friends"] as? [String]
 
            else { fatalError("could not parse Gnome from JSON file") }
        
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.age = age
        self.gWeight = gWeight
        self.gHeight = gHeight
        self.hairColor = hairColor
        self.arrProfs = arrProfs
        self.arrFriends = arrFriends
    }
}
