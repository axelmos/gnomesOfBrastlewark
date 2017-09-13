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

    // MARK - IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var gnome: GBGnome? {
        didSet {
            if let gnome = gnome {
                
                lblName.text = gnome.name
                lblAge.text = String(gnome.age)
                
                if let url = URL.init(string: gnome.thumbnail) {
                    //imgView.downloadedFrom(url: url)
                    imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "user_placeholder"))
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
