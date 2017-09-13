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
        var arrResults:[GBGnome] = [GBGnome]()
        var searchFound: Bool = false
        for i in 0..<GBGnomes.sharedInstance.arrGnomes.count {
            let str: String = GBGnomes.sharedInstance.arrGnomes[i].name
            if str.range(of:name) != nil {
                searchFound = true
                arrResults.append(GBGnomes.sharedInstance.arrGnomes[i])
            }
        }
        
        if searchFound {
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
        var arrResults:[GBGnome] = [GBGnome]()

        for i in 0..<GBGnomes.sharedInstance.arrGnomes.count {
            let str: String = GBGnomes.sharedInstance.arrGnomes[i].hairColor.lowercased()
            if str.range(of:color) != nil {
                arrResults.append(GBGnomes.sharedInstance.arrGnomes[i])
            }
            
        }
        
        if let barViewControllers = self.tabBarController?.viewControllers {
            let nav = barViewControllers[0] as! UINavigationController
            let vc = nav.viewControllers.first as! GBHomeViewController
            vc.arrSearchResults = arrResults
        }
        self.tabBarController?.selectedIndex = 0
    }

    // MARK: - UISearchBarDelegate
    // ----------------------------------------------------
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != "") {
            let searchTxt = searchBar.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            let encodedTxt = searchTxt?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            
            if (encodedTxt != "") {
                self.doSearch(name: encodedTxt!)
            }
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

