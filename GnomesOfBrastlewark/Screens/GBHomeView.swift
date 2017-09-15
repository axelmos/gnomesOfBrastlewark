//
//  GBHomeView.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/14/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBHomeView: UIView {
    
    var tableView: UITableView!
    var noContentView: UIView!
    var btnReload: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        tableView = UITableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configure() {
        
        // TABLE VIEW
        
        tableView.frame = self.bounds
        tableView.backgroundColor = UIColor.white
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.register(GBGnomeTableViewCell.self, forCellReuseIdentifier: "gnomeCell")
        
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // NO CONTENT VIEW
        
        noContentView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 100))
        noContentView.backgroundColor = UIColor.white
        noContentView.isHidden = true
        tableView.addSubview(noContentView)

        let lblNoContent = UILabel()
        lblNoContent.font = UIFont.systemFont(ofSize: 17)
        lblNoContent.text = NSLocalizedString("No content available", comment: "")
        noContentView.addSubview(lblNoContent)
        lblNoContent.translatesAutoresizingMaskIntoConstraints = false
        lblNoContent.topAnchor.constraint(equalTo: noContentView.topAnchor, constant: 30).isActive = true
        lblNoContent.heightAnchor.constraint(equalToConstant: 21).isActive = true
        lblNoContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        btnReload = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        btnReload.setTitle(NSLocalizedString("Reload", comment: ""), for: .normal)
        btnReload.setTitleColor(UIColor.blue, for: .normal)
        btnReload.isUserInteractionEnabled = true
        btnReload.isEnabled = true
        noContentView.addSubview(btnReload)
        btnReload.translatesAutoresizingMaskIntoConstraints = false
        btnReload.topAnchor.constraint(equalTo: lblNoContent.bottomAnchor, constant: 6).isActive = true
        btnReload.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btnReload.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnReload.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
}
