//
//  CollegeDetailViewController.swift
//  Core Data Relationship
//
//  Created by AshutoshD on 31/03/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {

    @IBOutlet weak var lblUniversity: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var indexRow = Int()
    var collegeDetail : College?{
        didSet{
            print(collegeDetail)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func BtnEditTapped(_ sender: UIBarButtonItem) {
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetails = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblName.text = collegeDetail?.name
        lblUniversity.text = collegeDetail?.university
        lblCity.text = collegeDetail?.city
        lblAddress.text = collegeDetail?.address
    }

    

}
