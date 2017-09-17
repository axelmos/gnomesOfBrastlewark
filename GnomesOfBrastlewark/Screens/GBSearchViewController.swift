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
    
    var mainView: GBSearchView! { return self.view as! GBSearchView }
    var navBarH: CGFloat!
    var tabBarH: CGFloat!
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------
    
    override func loadView() {
        navBarH = (self.navigationController?.navigationBar.intrinsicContentSize.height)! + UIApplication.shared.statusBarFrame.height
        
        view = GBSearchView(frame: UIScreen.main.bounds)
        mainView.setupConstraints(navBarHeight: navBarH)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Search", comment: "")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GBSearchViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    // ----------------------------------------------------
    
    func setupButtons() {
        mainView.searchBar.delegate = self
        mainView.btnPink.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
        mainView.btnPink.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
        mainView.btnRed.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
        mainView.btnGreen.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
        mainView.btnBlack.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
        mainView.btnGray.addTarget(self, action: #selector(GBSearchViewController.onFilterByColor(_:)), for: .touchUpInside)
    }
    
    func onFilterByColor(_ sender: UIButton) {
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
        
        mainView.lblNoResults.isHidden = true
        let arrResults:[GBGnome] = GBGnomes.sharedInstance.gnomes(withName: name)
        
        if arrResults.count > 0 {
            if let barViewControllers = self.tabBarController?.viewControllers {
                let nav = barViewControllers[0] as! UINavigationController
                let vc = nav.viewControllers.first as! GBHomeViewController
                vc.arrSearchResults = arrResults
            }
            self.tabBarController?.selectedIndex = 0
            
        } else {
            mainView.lblNoResults.isHidden = false
            mainView.searchBar.text = ""
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
        if (searchBar.text == NSLocalizedString("Search by Gnome name", comment: "")) {
            searchBar.text = ""
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Device Rotation
    // ----------------------------------------------------
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            //refresh view once rotation is completed not in will transition as it returns incorrect frame size.
            
            let navBarHPort = (self.navigationController?.navigationBar.intrinsicContentSize.height)! + UIApplication.shared.statusBarFrame.height
            
            let navBarHLand = (self.navigationController?.navigationBar.intrinsicContentSize.height)!
            
            if UIApplication.shared.statusBarOrientation == .portrait {
                // Portrait
                self.view = GBSearchView(frame: UIScreen.main.bounds)
                
                self.mainView.setupConstraints(navBarHeight: navBarHPort)
            } else {
                // Landscape
                self.view = GBSearchView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height - 20))
                
                self.mainView.setupConstraints(navBarHeight: navBarHLand)
            }
            self.setupButtons()
        })
        
        super.viewWillTransition(to: size, with: coordinator)
    }
}

