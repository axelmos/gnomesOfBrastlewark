//
//  GBSearchView.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/17/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBSearchView: UIView {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    var searchBar: UISearchBar!
    var lblNoResults: UILabel!
    var filterView: UIView!
    var filterInsideView: UIView!
    var btnPink: UIButton!
    var btnRed: UIButton!
    var btnGreen: UIButton!
    var btnBlack: UIButton!
    var btnGray: UIButton!
    var lblFilter: UILabel!
    
    // MARK: - init
    // ----------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchBar = UISearchBar()
        lblNoResults = UILabel()
        filterView = UIView()
        filterInsideView = UIView()
        btnPink = UIButton(frame: CGRect(x: 11, y: 41, width: 38, height: 28))
        btnRed = UIButton(frame: CGRect(x: 56, y: 41, width: 38, height: 28))
        btnGreen = UIButton(frame: CGRect(x: 101, y: 41, width: 38, height: 28))
        btnBlack = UIButton(frame: CGRect(x: 146, y: 41, width: 38, height: 28))
        btnGray = UIButton(frame: CGRect(x: 191, y: 41, width: 38, height: 28))
        lblFilter = UILabel()
        
        self.addSubview(searchBar)
        self.addSubview(filterView)
        filterView.addSubview(filterInsideView)
        filterInsideView.addSubview(lblFilter)
        filterInsideView.addSubview(btnPink)
        filterInsideView.addSubview(btnRed)
        filterInsideView.addSubview(btnGreen)
        filterInsideView.addSubview(btnBlack)
        filterInsideView.addSubview(btnGray)
        self.addSubview(lblNoResults)
        
        setupViews() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views and Constraints
    // ----------------------------------------------------
    
    private func setupViews() {
        
        self.backgroundColor = UIColor.white
        filterView.backgroundColor = UIColor.groupTableViewBackground
        filterInsideView.backgroundColor = UIColor.groupTableViewBackground
        btnPink.backgroundColor = UIColor.init(colorLiteralRed: 255.0/255.0, green: 21.0/255.0, blue: 142.0/255.0, alpha: 1.0)
        btnRed.backgroundColor = UIColor.red
        btnGreen.backgroundColor = UIColor.green
        btnBlack.backgroundColor = UIColor.black
        btnGray.backgroundColor = UIColor.gray
        btnPink.tag = 0
        btnRed.tag = 1
        btnGreen.tag = 2
        btnBlack.tag = 3
        btnGray.tag = 4
        
        lblNoResults.text = NSLocalizedString("No results.\r\nTry with a different name.", comment: "")
        lblFilter.text = NSLocalizedString("or filter by hair color", comment: "")
        lblFilter.textAlignment = .center
        lblNoResults.textAlignment = .center
        lblNoResults.numberOfLines = 3
        lblNoResults.isHidden = true
        
        searchBar.placeholder = NSLocalizedString("Search by Gnome name", comment: "")
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterInsideView.translatesAutoresizingMaskIntoConstraints = false
        lblNoResults.translatesAutoresizingMaskIntoConstraints = false
        lblFilter.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints(navBarHeight: CGFloat) {
        
        // SEARCH BAR
        
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: navBarHeight).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        // FILTER VIEW
        
        filterView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        filterView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        filterView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        filterView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        // FILTER INSIDE VIEW
        
        filterInsideView.centerXAnchor.constraint(equalTo: filterView.centerXAnchor).isActive = true
        filterInsideView.bottomAnchor.constraint(equalTo: filterView.bottomAnchor).isActive = true
        filterInsideView.topAnchor.constraint(equalTo: filterView.topAnchor).isActive = true
        filterInsideView.widthAnchor.constraint(equalToConstant: 240).isActive = true

        lblFilter.leadingAnchor.constraint(equalTo: filterInsideView.leadingAnchor).isActive = true
        lblFilter.trailingAnchor.constraint(equalTo: filterInsideView.trailingAnchor).isActive = true
        lblFilter.topAnchor.constraint(equalTo: filterInsideView.topAnchor, constant: 10).isActive = true
        lblFilter.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // NO RESULTS LABEL
        
        lblNoResults.centerXAnchor.constraint(equalTo: searchBar.centerXAnchor).isActive = true
        lblNoResults.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 40).isActive = true
        lblNoResults.heightAnchor.constraint(equalToConstant: 60).isActive = true
        lblNoResults.widthAnchor.constraint(equalToConstant: 195).isActive = true
    }
}
