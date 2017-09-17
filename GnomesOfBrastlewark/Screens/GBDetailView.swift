//
//  GBDetailView.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/14/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBDetailView: UIView {

    // MARK: - Declarations
    // ----------------------------------------------------
    
    var contentView: UIView!
    var lblAge: UILabel!
    var lblWeight: UILabel!
    var lblHeight: UILabel!
    var lblHairColor: UILabel!
    var imageView: UIImageView!
    var tableProf: UITableView!
    var tableFriends: UITableView!
    var bottomView: UIView!
    var topView: UIView!
    var dataView: UIView!
    var dataSubView: UIView!
    var lblAgeTitle: UILabel!
    var lblWeightTitle: UILabel!
    var lblHeightTitle: UILabel!
    var lblHairTitle: UILabel!
    
    // MARK: - init
    // ----------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView = UIView()
        topView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 384))
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 414, height: 240))
        dataView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 72))
        dataSubView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 72))
        lblAgeTitle = UILabel(frame: CGRect(x: 0, y: 13, width: 65, height: 21))
        lblAge = UILabel(frame: CGRect(x: 0, y: 0, width: 65, height: 21))
        lblWeightTitle = UILabel(frame: CGRect(x: 65, y: 13, width: 85, height: 21))
        lblWeight = UILabel(frame: CGRect(x: 0, y: 0, width: 85, height: 21))
        lblHeightTitle = UILabel(frame: CGRect(x: 150, y: 13, width: 85, height: 21))
        lblHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 85, height: 21))
        lblHairTitle = UILabel(frame: CGRect(x: 235, y: 13, width: 65, height: 21))
        lblHairColor = UILabel(frame: CGRect(x: 0, y: 0, width: 38, height: 15))
        bottomView = UIView(frame: CGRect(x: 20, y: 332, width: 374, height: 384))
        tableProf = UITableView()
        tableFriends = UITableView()
        
        self.addSubview(contentView)
        contentView.addSubview(topView)
        topView.addSubview(imageView)
        topView.addSubview(dataView)
        dataView.addSubview(dataSubView)
        dataSubView.addSubview(lblAgeTitle)
        dataSubView.addSubview(lblAge)
        dataSubView.addSubview(lblWeightTitle)
        dataSubView.addSubview(lblWeight)
        dataSubView.addSubview(lblHeightTitle)
        dataSubView.addSubview(lblHeight)
        dataSubView.addSubview(lblHairTitle)
        dataSubView.addSubview(lblHairColor)
        contentView.addSubview(bottomView)
        bottomView.addSubview(tableProf)
        bottomView.addSubview(tableFriends)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views and Constraints
    // ----------------------------------------------------
    
    private func setupViews() {
        self.backgroundColor = UIColor.lightGray
        
        contentView.backgroundColor = UIColor.lightGray
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.backgroundColor = UIColor.lightGray
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        dataView.backgroundColor = UIColor.darkGray
        dataView.translatesAutoresizingMaskIntoConstraints = false
        
        dataSubView.backgroundColor = UIColor.darkGray
        dataSubView.translatesAutoresizingMaskIntoConstraints = false
        
        lblAgeTitle.text = NSLocalizedString("AGE", comment: "")
        lblAgeTitle.textColor = UIColor.lightGray
        lblAgeTitle.textAlignment = .center
        lblAgeTitle.font = UIFont.systemFont(ofSize: 14)
        lblAgeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblAge.textColor = UIColor.white
        lblAge.textAlignment = .center
        lblAge.font = UIFont.boldSystemFont(ofSize: 17)
        lblAge.translatesAutoresizingMaskIntoConstraints = false
        
        lblWeightTitle.text = NSLocalizedString("WEIGHT", comment: "")
        lblWeightTitle.textColor = UIColor.lightGray
        lblWeightTitle.textAlignment = .center
        lblWeightTitle.font = UIFont.systemFont(ofSize: 14)
        lblWeightTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblWeight.textColor = UIColor.white
        lblWeight.textAlignment = .center
        lblWeight.font = UIFont.boldSystemFont(ofSize: 17)
        lblWeight.translatesAutoresizingMaskIntoConstraints = false
        
        lblHeightTitle.text = NSLocalizedString("HEIGHT", comment: "")
        lblHeightTitle.textColor = UIColor.lightGray
        lblHeightTitle.textAlignment = .center
        lblHeightTitle.font = UIFont.systemFont(ofSize: 14)
        lblHeightTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblHeight.textColor = UIColor.white
        lblHeight.textAlignment = .center
        lblHeight.font = UIFont.boldSystemFont(ofSize: 17)
        lblHeight.translatesAutoresizingMaskIntoConstraints = false
        
        lblHairTitle.text = NSLocalizedString("HAIR", comment: "")
        lblHairTitle.textColor = UIColor.lightGray
        lblHairTitle.textAlignment = .center
        lblHairTitle.font = UIFont.systemFont(ofSize: 14)
        lblHairTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblHairColor.textColor = UIColor.white
        lblHairColor.textAlignment = .center
        lblHairColor.font = UIFont.boldSystemFont(ofSize: 17)
        lblHairColor.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.backgroundColor = UIColor.white
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        tableProf.separatorInset = UIEdgeInsets.zero
        tableFriends.separatorInset = UIEdgeInsets.zero
        tableProf.sectionHeaderHeight = 40
        tableFriends.sectionHeaderHeight = 40
        tableProf.isUserInteractionEnabled = true
        tableFriends.isUserInteractionEnabled = true
        tableProf.translatesAutoresizingMaskIntoConstraints = false
        tableFriends.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints(navBarHeight: CGFloat, tabBarHeight: CGFloat) {
        
        // CONTENT VIEW
        
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: navBarHeight).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -tabBarHeight).isActive = true
        
        // TOP VIEW (container for image and dark gray bar)
        
        topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            // Portrait
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        } else {
            // Landscape
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(self.frame.size.width/2)).isActive = true
        }
        
        // IMAGE VIEW
        
        imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        
        // DARK GRAY VIEW

        dataView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        dataView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        dataView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        if UIDevice.current.orientation == .portrait {
            // Portrait
            dataView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        } else {
            // Landscape
            dataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: dataView.topAnchor).isActive = true
        }
        
        // TOP VIEW HEIGHT
        if UIDevice.current.orientation == .portrait {
            // Portrait
            topView.heightAnchor.constraint(equalToConstant: (dataView.frame.size.height + imageView.frame.size.height)).isActive = true
        } else {
            // Landscape
            topView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0).isActive = true
        }
        
        // DARK GRAY INSIDE VIEW
        
        dataSubView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        dataSubView.topAnchor.constraint(equalTo: dataView.topAnchor).isActive = true
        dataSubView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        dataSubView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // AGE LABELS
        
        lblAgeTitle.leadingAnchor.constraint(equalTo: dataSubView.leadingAnchor).isActive = true
        lblAgeTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblAgeTitle.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblAgeTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        lblAge.leadingAnchor.constraint(equalTo: dataSubView.leadingAnchor).isActive = true
        lblAge.topAnchor.constraint(equalTo: lblAgeTitle.bottomAnchor, constant: 4).isActive = true
        lblAge.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblAge.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // WEIGHT LABELS
        
        lblWeightTitle.leadingAnchor.constraint(equalTo: lblAgeTitle.trailingAnchor).isActive = true
        lblWeightTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblWeightTitle.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblWeightTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        lblWeight.leadingAnchor.constraint(equalTo: lblWeightTitle.leadingAnchor).isActive = true
        lblWeight.topAnchor.constraint(equalTo: lblWeightTitle.bottomAnchor, constant: 4).isActive = true
        lblWeight.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblWeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // HEIGHT LABELS
        
        lblHeightTitle.leadingAnchor.constraint(equalTo: lblWeightTitle.trailingAnchor).isActive = true
        lblHeightTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblHeightTitle.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblHeightTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        lblHeight.leadingAnchor.constraint(equalTo: lblHeightTitle.leadingAnchor).isActive = true
        lblHeight.topAnchor.constraint(equalTo: lblHeightTitle.bottomAnchor, constant: 4).isActive = true
        lblHeight.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblHeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // HAIR LABELS
        
        lblHairTitle.leadingAnchor.constraint(equalTo: lblHeightTitle.trailingAnchor).isActive = true
        lblHairTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblHairTitle.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblHairTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        lblHairColor.centerXAnchor.constraint(equalTo: lblHairTitle.centerXAnchor).isActive = true
        lblHairColor.topAnchor.constraint(equalTo: lblHairTitle.bottomAnchor, constant: 7).isActive = true
        lblHairColor.widthAnchor.constraint(equalToConstant: 38).isActive = true
        lblHairColor.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // BOTTOM VIEW WITH 2 TABLES
        
        bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        if UIDevice.current.orientation == .portrait {
            // Portrait
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        } else {
            // Landscape
            bottomView.leadingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 20).isActive = true
            bottomView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        }
        
        // TABLE VIEWS
        
        tableProf.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        tableProf.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        tableProf.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        let tableWidth = bottomView.frame.size.width / 2
        tableProf.widthAnchor.constraint(equalToConstant: tableWidth - 24).isActive = true
        
        tableFriends.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
        tableFriends.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        tableFriends.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        tableFriends.widthAnchor.constraint(equalToConstant: tableWidth - 10).isActive = true
        
    }
}
