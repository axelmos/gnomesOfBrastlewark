//
//  GBHomeViewController.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit
import SVProgressHUD

class GBHomeViewController: UITableViewController {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    var arrGnomes: [GBGnome] = [GBGnome]()
    var arrSearchResults: [GBGnome] = [GBGnome]()
    @IBOutlet var btnCancel: UIBarButtonItem!
    @IBOutlet weak var noContentView: UIView!
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        tableView.separatorInset = UIEdgeInsets.zero
        
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Only for search results...
        if arrSearchResults.count > 0 {
            self.title = String(format:"%d Search Results", arrSearchResults.count)
            self.navigationItem.leftBarButtonItem = btnCancel
            arrGnomes = arrSearchResults
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBActions & Functions
    // ----------------------------------------------------
    
    func loadContent() {
        if GBUtils.isInternetAvailable() {
            SVProgressHUD.show(withStatus: "Loading")
            
            GBDataManager.getAllGnomes { (gnomes) in
                GBGnomes.sharedInstance.arrGnomes = gnomes
                self.arrGnomes = GBGnomes.sharedInstance.arrGnomes
                
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        SVProgressHUD.dismiss()
                    }
                }
            }
        } else {
            noContentView.isHidden = false
            
            let alert = UIAlertController(title: "Warning", message: "No internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func onReloadContent (_ sender: AnyObject) {
        loadContent()
    }
    
    @IBAction func onCancelSearch(_ sender: AnyObject) {
        self.navigationItem.leftBarButtonItem = nil
        self.title = "Gnomes of Brastlewark"
        arrGnomes = GBGnomes.sharedInstance.arrGnomes
        arrSearchResults = [GBGnome]()
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - UITableViewDataSource
    // ----------------------------------------------------
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGnomes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gnomeCell") as! GBGnomeTableViewCell
        cell.gnome = arrGnomes[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetailSegue", sender: indexPath)
    }
    
    // MARK: - Navigation
    // ----------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showDetailSegue"{
            let detailVC = segue.destination as! GBDetailViewController
            let indexPath = sender as! IndexPath
            detailVC.gnome = arrGnomes[indexPath.row]
        }
    }
}

