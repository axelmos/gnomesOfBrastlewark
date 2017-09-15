//
//  GBDetailViewController.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/12/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBDetailViewController: UIViewController {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    var gnome: GBGnome!
    var arrProfs: [String] = [String]()
    var arrFriends: [String] = [String]()
    var mainView: GBDetailView! { return self.view as! GBDetailView }
    let profsCellReuseIdentifier = "profsCell"
    let friendsCellReuseIdentifier = "friendsCell"
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------
    
    override func loadView() {
        let navBarH = (self.navigationController?.navigationBar.intrinsicContentSize.height)! + UIApplication.shared.statusBarFrame.height
        let tabBarH = (self.tabBarController?.tabBar.frame.size.height)!

        view = GBDetailView(frame: UIScreen.main.bounds)
        mainView.configure(navBarHeight: navBarH, tabBarHeight: tabBarH)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableProf.register(UITableViewCell.self, forCellReuseIdentifier: profsCellReuseIdentifier)
        mainView.tableFriends.register(UITableViewCell.self, forCellReuseIdentifier: friendsCellReuseIdentifier)
        mainView.tableProf.dataSource = self
        mainView.tableProf.delegate = self
        mainView.tableFriends.dataSource = self
        mainView.tableFriends.delegate = self
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backBlack"), style: .plain, target: self, action: #selector(GBDetailViewController.onBack))
        
        setContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions & Functions
    // ----------------------------------------------------
    
    func setContent() {
        if let gnome = gnome {
            self.title = gnome.name
            mainView.lblAge.text = String(gnome.age)
            mainView.lblWeight.text = String(format:"%.2f" , gnome.gWeight)
            mainView.lblHeight.text = String(format:"%.2f" , gnome.gHeight)
            mainView.lblHairColor.backgroundColor = gnome.getHairColor(strColor: gnome.hairColor)
            arrProfs = gnome.arrProfs
            arrFriends = gnome.arrFriends
            if let url = URL.init(string: gnome.thumbnail) {
                mainView.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
            }
            mainView.tableProf.reloadData()
            mainView.tableFriends.reloadData()
        }
    }
    
    func onBack() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        //TODO: Update layout when rotate device
        
        /*if UIDevice.current.orientation.isLandscape {
         
            mainView.bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            mainView.bottomView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
            mainView.bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            mainView.bottomView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true
        }*/
    }
}

// MARK: - UITableViewDataSource
// ----------------------------------------------------

extension GBDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainView.tableProf {
            return arrProfs.count
        } else {
            return arrFriends.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell!
        
        if tableView == mainView.tableProf {
            cell = tableView.dequeueReusableCell(withIdentifier: profsCellReuseIdentifier)!
            cell.textLabel?.text = arrProfs[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: friendsCellReuseIdentifier)!
            cell.textLabel?.text = arrFriends[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == mainView.tableFriends {
            
            let aGnome = GBGnomes.sharedInstance.gnome(withName: arrFriends[indexPath.row])
            
            gnome = aGnome
            setContent()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let lblHeader = UILabel(frame: CGRect(x: 0, y: 13, width: 176, height: 18))
        if tableView == mainView.tableFriends {
            lblHeader.text = NSLocalizedString("FRIENDS", comment: "")
        } else {
            lblHeader.text = NSLocalizedString("PROFESSIONS", comment: "")
        }
        lblHeader.textColor = UIColor.black
        lblHeader.font = UIFont.boldSystemFont(ofSize: 15)
        lblHeader.textAlignment = .center
        
        view.addSubview(lblHeader)
        
        return view
    }
}
