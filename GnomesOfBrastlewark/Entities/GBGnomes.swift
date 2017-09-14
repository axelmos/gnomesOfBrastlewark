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
    
    // MARK: * Get Gnome by name
    
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
    
    // MARK: * Get Gnomes filtered by hair color
    
    func gnomes(withHairColor: String) -> [GBGnome] {
        
        var arrFiltered:[GBGnome] = [GBGnome]()
        
        for i in 0..<GBGnomes.sharedInstance.arrGnomes.count {
            let str: String = GBGnomes.sharedInstance.arrGnomes[i].hairColor.lowercased()
            if str.range(of:withHairColor) != nil {
                arrFiltered.append(GBGnomes.sharedInstance.arrGnomes[i])
            }
            
        }
        
        return arrFiltered
    }
    
    // MARK: * Get Gnomes filtered by name (Search)
    
    func gnomes(withName: String) -> [GBGnome] {
        
        var arrResults:[GBGnome] = [GBGnome]()
        
        for i in 0..<GBGnomes.sharedInstance.arrGnomes.count {
            let str: String = GBGnomes.sharedInstance.arrGnomes[i].name.lowercased()
            if str.range(of:withName) != nil {
                arrResults.append(GBGnomes.sharedInstance.arrGnomes[i])
            }
        }
        
        return arrResults
    }
}
