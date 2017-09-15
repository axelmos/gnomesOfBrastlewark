//
//  GBGnomeTableViewCell.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit
import SDWebImage

class GBGnomeTableViewCell: UITableViewCell {

    // MARK - Definitions
    var lblName: UILabel! = UILabel()
    var lblAge: UILabel! = UILabel()
    var imgView: UIImageView! = UIImageView()
    
    var gnome: GBGnome? {
        didSet {
            if let gnome = gnome {
                
                lblName.text = gnome.name
                lblAge.text = String(format: NSLocalizedString("Age: %d", comment: ""), gnome.age)
                
                if let url = URL.init(string: gnome.thumbnail) {
                    imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
                }
            }
        }
    }
    
    func configureCell(withGnome: GBGnome) {
        
        self.addSubview(imgView)
        self.addSubview(lblName)
        self.addSubview(lblAge)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        lblName.font = UIFont.boldSystemFont(ofSize: 17)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 17).isActive = true
        lblName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8).isActive = true
        lblName.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        lblAge.font = UIFont.systemFont(ofSize: 12)
        lblAge.translatesAutoresizingMaskIntoConstraints = false
        lblAge.leadingAnchor.constraint(equalTo: lblName.leadingAnchor).isActive = true
        lblAge.topAnchor.constraint(equalTo: lblName.bottomAnchor).isActive = true
        lblAge.heightAnchor.constraint(equalToConstant: 21).isActive = true
        

        gnome = withGnome
    }
}
