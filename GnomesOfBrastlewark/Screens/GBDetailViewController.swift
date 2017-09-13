//
//  GBDetailViewController.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/12/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit

class GBDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableProf: UITableView!
    @IBOutlet weak var tableFriends: UITableView!
    var gnome: GBGnome!
    var arrProfs: [String] = [String]()
    var arrFriends: [String] = [String]()
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableProf.separatorInset = UIEdgeInsets.zero
        tableFriends.separatorInset = UIEdgeInsets.zero
        
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
            lblAge.text = String(gnome.age)
            lblWeight.text = String(format:"%.2f" , gnome.gWeight)
            lblHeight.text = String(format:"%.2f" , gnome.gHeight)
            colorView.backgroundColor = gnome.getHairColor(strColor: gnome.hairColor)
            arrProfs = gnome.arrProfs
            arrFriends = gnome.arrFriends
            if let url = URL.init(string: gnome.thumbnail) {
                imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
            }
            tableProf.reloadData()
            tableFriends.reloadData()
        }
    }
    
    @IBAction func onBack(_ sender: AnyObject) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UITableViewDataSource
    // ----------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableProf {
            return arrProfs.count
        } else {
            return arrFriends.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell!
        
        if tableView == tableProf {
            cell = tableView.dequeueReusableCell(withIdentifier: "profsCell")!
            cell.textLabel?.text = arrProfs[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell")!
            cell.textLabel?.text = arrFriends[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)

        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == tableFriends {
      
            let aGnome = GBGnomes.sharedInstance.gnome(withName: arrFriends[indexPath.row])
            
            gnome = aGnome
            setContent()
        }
    }
}
