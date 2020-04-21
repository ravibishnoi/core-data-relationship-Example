//
//  CollegeListCell.swift
//  Core Data Relationship
//
//  Created by AshutoshD on 31/03/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class CollegeListCell: UITableViewCell {

    
    @IBOutlet var lblName : UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var college : College?{
        didSet{
            lblName.text =          "Name:       \(college?.name ?? "")"
            lblCity.text =          "City:       \(college?.city ?? "")"
            lblAddress.text =       "Address:    \(college?.address ?? "")"
            lblUniversity.text =    "University: \(college?.university ?? "")"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
