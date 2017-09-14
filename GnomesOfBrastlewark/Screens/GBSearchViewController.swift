//
//  GBSearchViewController.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBSearchViewController: UIViewController, UISearchBarDelegate {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblNoResults: UILabel!
    @IBOutlet weak var filterView: UIView!
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GBSearchViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    // ----------------------------------------------------
    
    @IBAction func onFilterByColor(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            doFilter(color:"pink")
            break
        case 1:
            doFilter(color:"red")
            break
        case 2:
            doFilter(color:"green")
            break
        case 3:
            doFilter(color:"black")
            break
        case 4:
            doFilter(color:"gray")
            break
        default:
            doFilter(color:"black")
        }
    }
    
    func doSearch(name: String) {
        
        let arrResults:[GBGnome] = GBGnomes.sharedInstance.gnomes(withName: name)
        
        if arrResults.count > 0 {
            if let barViewControllers = self.tabBarController?.viewControllers {
                let nav = barViewControllers[0] as! UINavigationController
                let vc = nav.viewControllers.first as! GBHomeViewController
                vc.arrSearchResults = arrResults
            }
            self.tabBarController?.selectedIndex = 0
            
        } else {
            lblNoResults.isHidden = false
            searchBar.text = ""
        }
    }
    
    func doFilter(color: String) {
        
        let arrFiltered:[GBGnome] = GBGnomes.sharedInstance.gnomes(withHairColor: color)
        
        if let barViewControllers = self.tabBarController?.viewControllers {
            let nav = barViewControllers[0] as! UINavigationController
            let vc = nav.viewControllers.first as! GBHomeViewController
            vc.arrSearchResults = arrFiltered
        }
        self.tabBarController?.selectedIndex = 0
    }

    // MARK: - UISearchBarDelegate
    // ----------------------------------------------------
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != "") {
            self.doSearch(name: (searchBar.text?.lowercased())!)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (searchBar.text == "Search by Gnome name") {
            searchBar.text = ""
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

