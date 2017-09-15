//
//  GBDetailView.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/14/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBDetailView: UIView {

    var scrollView: UIScrollView!
    var contentView: UIView!
    var lblAge: UILabel!
    var lblWeight: UILabel!
    var lblHeight: UILabel!
    var lblHairColor: UILabel!
    var imageView: UIImageView!
    var tableProf: UITableView!
    var tableFriends: UITableView!
    var bottomView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        scrollView = UIScrollView()
        lblAge = UILabel(frame: CGRect(x: 0, y: 0, width: 65, height: 21))
        lblWeight = UILabel(frame: CGRect(x: 0, y: 0, width: 85, height: 21))
        lblHeight = UILabel(frame: CGRect(x: 0, y: 0, width: 85, height: 21))
        lblHairColor = UILabel(frame: CGRect(x: 0, y: 0, width: 38, height: 15))
        tableProf = UITableView()
        tableFriends = UITableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(navBarHeight: CGFloat, tabBarHeight: CGFloat) {
        
        // SCROLL VIEW
        
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant:navBarHeight).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-tabBarHeight).isActive = true
        
        // CONTENT VIEW INSIDE SCROLL VIEW
        
        contentView = UIView(frame: scrollView.frame)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // IMAGE VIEW
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 414, height: 240))
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        // DARK GRAY VIEW
        
        let dataView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 72))
        dataView.backgroundColor = UIColor.darkGray
        contentView.addSubview(dataView)
        dataView.translatesAutoresizingMaskIntoConstraints = false
        dataView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dataView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        dataView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        dataView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        // DARK GRAY INSIDE VIEW
        
        let dataSubView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 72))
        dataSubView.backgroundColor = UIColor.darkGray
        dataView.addSubview(dataSubView)
        dataSubView.translatesAutoresizingMaskIntoConstraints = false
        dataSubView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dataSubView.topAnchor.constraint(equalTo: dataView.topAnchor).isActive = true
        dataSubView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        dataSubView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // AGE LABELS
        
        let lblAgeTitle = UILabel(frame: CGRect(x: 0, y: 13, width: 65, height: 21))
        lblAgeTitle.text = NSLocalizedString("AGE", comment: "")
        lblAgeTitle.textColor = UIColor.lightGray
        lblAgeTitle.textAlignment = .center
        lblAgeTitle.font = UIFont.systemFont(ofSize: 14)
        dataSubView.addSubview(lblAgeTitle)
        lblAgeTitle.translatesAutoresizingMaskIntoConstraints = false
        lblAgeTitle.leadingAnchor.constraint(equalTo: dataSubView.leadingAnchor).isActive = true
        lblAgeTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblAgeTitle.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblAgeTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        dataSubView.addSubview(lblAge)
        lblAge.textColor = UIColor.white
        lblAge.textAlignment = .center
        lblAge.font = UIFont.boldSystemFont(ofSize: 17)
        lblAge.translatesAutoresizingMaskIntoConstraints = false
        lblAge.leadingAnchor.constraint(equalTo: dataSubView.leadingAnchor).isActive = true
        lblAge.topAnchor.constraint(equalTo: lblAgeTitle.bottomAnchor, constant: 4).isActive = true
        lblAge.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblAge.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // WEIGHT LABELS
        
        let lblWeightTitle = UILabel(frame: CGRect(x: 65, y: 13, width: 85, height: 21))
        lblWeightTitle.text = NSLocalizedString("WEIGHT", comment: "")
        lblWeightTitle.textColor = UIColor.lightGray
        lblWeightTitle.textAlignment = .center
        lblWeightTitle.font = UIFont.systemFont(ofSize: 14)
        dataSubView.addSubview(lblWeightTitle)
        lblWeightTitle.translatesAutoresizingMaskIntoConstraints = false
        lblWeightTitle.leadingAnchor.constraint(equalTo: lblAgeTitle.trailingAnchor).isActive = true
        lblWeightTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblWeightTitle.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblWeightTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        dataSubView.addSubview(lblWeight)
        lblWeight.textColor = UIColor.white
        lblWeight.textAlignment = .center
        lblWeight.font = UIFont.boldSystemFont(ofSize: 17)
        lblWeight.translatesAutoresizingMaskIntoConstraints = false
        lblWeight.leadingAnchor.constraint(equalTo: lblWeightTitle.leadingAnchor).isActive = true
        lblWeight.topAnchor.constraint(equalTo: lblWeightTitle.bottomAnchor, constant: 4).isActive = true
        lblWeight.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblWeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // HEIGHT LABELS
        
        let lblHeightTitle = UILabel(frame: CGRect(x: 150, y: 13, width: 85, height: 21))
        lblHeightTitle.text = NSLocalizedString("HEIGHT", comment: "")
        lblHeightTitle.textColor = UIColor.lightGray
        lblHeightTitle.textAlignment = .center
        lblHeightTitle.font = UIFont.systemFont(ofSize: 14)
        dataSubView.addSubview(lblHeightTitle)
        lblHeightTitle.translatesAutoresizingMaskIntoConstraints = false
        lblHeightTitle.leadingAnchor.constraint(equalTo: lblWeightTitle.trailingAnchor).isActive = true
        lblHeightTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblHeightTitle.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblHeightTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        dataSubView.addSubview(lblHeight)
        lblHeight.textColor = UIColor.white
        lblHeight.textAlignment = .center
        lblHeight.font = UIFont.boldSystemFont(ofSize: 17)
        lblHeight.translatesAutoresizingMaskIntoConstraints = false
        lblHeight.leadingAnchor.constraint(equalTo: lblHeightTitle.leadingAnchor).isActive = true
        lblHeight.topAnchor.constraint(equalTo: lblHeightTitle.bottomAnchor, constant: 4).isActive = true
        lblHeight.widthAnchor.constraint(equalToConstant: 85).isActive = true
        lblHeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // HAIR LABELS
        
        let lblHairTitle = UILabel(frame: CGRect(x: 235, y: 13, width: 65, height: 21))
        lblHairTitle.text = NSLocalizedString("HAIR", comment: "")
        lblHairTitle.textColor = UIColor.lightGray
        lblHairTitle.textAlignment = .center
        lblHairTitle.font = UIFont.systemFont(ofSize: 14)
        dataSubView.addSubview(lblHairTitle)
        lblHairTitle.translatesAutoresizingMaskIntoConstraints = false
        lblHairTitle.leadingAnchor.constraint(equalTo: lblHeightTitle.trailingAnchor).isActive = true
        lblHairTitle.topAnchor.constraint(equalTo: dataSubView.topAnchor, constant: 13).isActive = true
        lblHairTitle.widthAnchor.constraint(equalToConstant: 65).isActive = true
        lblHairTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        dataSubView.addSubview(lblHairColor)
        lblHairColor.textColor = UIColor.white
        lblHairColor.textAlignment = .center
        lblHairColor.font = UIFont.boldSystemFont(ofSize: 17)
        lblHairColor.translatesAutoresizingMaskIntoConstraints = false
        lblHairColor.centerXAnchor.constraint(equalTo: lblHairTitle.centerXAnchor).isActive = true
        lblHairColor.topAnchor.constraint(equalTo: lblHairTitle.bottomAnchor, constant: 7).isActive = true
        lblHairColor.widthAnchor.constraint(equalToConstant: 38).isActive = true
        lblHairColor.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // BOTTOM VIEW WITH 2 TABLES
        
        bottomView = UIView(frame: CGRect(x: 20, y: 332, width: 374, height: 384))
        bottomView.backgroundColor = UIColor.white
        contentView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        bottomView.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 20).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        // TABLE VIEWS
        
        tableProf.separatorInset = UIEdgeInsets.zero
        tableFriends.separatorInset = UIEdgeInsets.zero
        tableProf.sectionHeaderHeight = 40
        tableFriends.sectionHeaderHeight = 40
        tableProf.isUserInteractionEnabled = true
        tableFriends.isUserInteractionEnabled = true
        
        bottomView.addSubview(tableProf)
        bottomView.addSubview(tableFriends)
        tableProf.translatesAutoresizingMaskIntoConstraints = false
        tableProf.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
        tableProf.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        tableProf.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        let tableWidth = bottomView.frame.size.width / 2
        tableProf.widthAnchor.constraint(equalToConstant: tableWidth - 24).isActive = true
        
        tableFriends.translatesAutoresizingMaskIntoConstraints = false
        tableFriends.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
        tableFriends.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        tableFriends.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        tableFriends.widthAnchor.constraint(equalToConstant: tableWidth - 10).isActive = true
        
        //contentView.heightAnchor.constraint(equalToConstant: 1800).isActive = true
        //contentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        //scrollView.contentSize = CGSize(width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
}
