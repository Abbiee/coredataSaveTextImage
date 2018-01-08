//
//  customTableCell.swift
//  coreDataImageSave
//
//  Created by Bibin Mathew on 1/8/18.
//  Copyright © 2018 featherSoft. All rights reserved.
//

import UIKit

class customTableCell: UITableViewCell {

    @IBOutlet weak var customcellImage: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
