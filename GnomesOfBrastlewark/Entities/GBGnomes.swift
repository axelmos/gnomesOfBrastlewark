//
//  GBGnomes.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/12/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBGnomes: NSObject {
    var arrGnomes: [GBGnome]
    static var sharedInstance: GBGnomes = GBGnomes()
    
    private override init() {
        arrGnomes = [GBGnome]()
        
        super.init()
    }
    
    func gnome(withName: String) -> GBGnome {
        
        for i in 0..<arrGnomes.count {
            if arrGnomes[i].name == withName {
                
                return arrGnomes[i]
            }
        }
        
        // Just in case...
        print("** Gnome not found **")
        return GBGnome(dict: [:])
    }
}
