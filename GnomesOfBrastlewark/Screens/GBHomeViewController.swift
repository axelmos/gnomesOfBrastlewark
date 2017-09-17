//
//  GBHomeViewController.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import UIKit
import SVProgressHUD

class GBHomeViewController: UIViewController {

    // MARK: - Definitions
    // ----------------------------------------------------
    
    var arrGnomes: [GBGnome] = [GBGnome]()
    var arrSearchResults: [GBGnome] = [GBGnome]()
    var mainView: GBHomeView! { return self.view as! GBHomeView }
    
    // MARK: - ViewController lifecycle
    // ----------------------------------------------------

    override func loadView() {
        view = GBHomeView(frame: UIScreen.main.bounds)
        mainView.setupViews()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.btnReload.addTarget(self, action: #selector(GBHomeViewController.loadContent), for: .touchUpInside)
        
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Only for search results...
        if arrSearchResults.count > 0 {
            self.title = String(format:"%d Search Results", arrSearchResults.count)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(GBHomeViewController.onCancelSearch))
            arrGnomes = arrSearchResults
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.async {
                    self.mainView.tableView.reloadData()
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
                        self.mainView.tableView.reloadData()
                        SVProgressHUD.dismiss()
                        self.mainView.noContentView.isHidden = true
                    }
                }
            }
        } else {
            mainView.noContentView.isHidden = false
            
            let alert = UIAlertController(title: "Warning", message: "No internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func onCancelSearch() {
        self.navigationItem.leftBarButtonItem = nil
        self.title = "Gnomes of Brastlewark"
        arrGnomes = GBGnomes.sharedInstance.arrGnomes
        arrSearchResults = [GBGnome]()
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
// ----------------------------------------------------

extension GBHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGnomes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gnomeCell") as! GBGnomeTableViewCell
        
        cell.configureCell(withGnome: arrGnomes[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = GBDetailViewController()
        detailVC.gnome = arrGnomes[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

