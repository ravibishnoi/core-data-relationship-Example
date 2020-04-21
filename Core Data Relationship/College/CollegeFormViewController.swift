//
//  CollegeFormViewController.swift
//  Core Data Relationship
//
//  Created by AshutoshD on 30/03/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    @IBOutlet weak var txtCollegeAdd: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    @IBOutlet weak var btnSave : UIButton!
    var isUpdate = false
    var indexRow  = Int()
    var collegeDetails: College?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate {
            btnSave.setTitle("Update", for: .normal)
        }
        else{
            btnSave.setTitle("Save", for: .normal)
        }
        
        txtCollegeName.text = collegeDetails?.name
        txtUniversity.text = collegeDetails?.university
        txtCollegeCity.text = collegeDetails?.city
        txtCollegeAdd.text = collegeDetails?.address
    }
    
   

}
//MARK: Action
extension CollegeFormViewController{
   
    @IBAction func BtnCollegeSaveTapped(_ sender: UIButton) {
        collegeSaveData()
        navigationController?.popViewController(animated: true)
    }
    
}
//MARK: Method
extension CollegeFormViewController {
    func collegeSaveData(){
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAdd.text else { return   }
        guard let collegeCity = txtCollegeCity.text else { return   }
        guard let collegeUniversity = txtUniversity.text else { return }
        
        let collegeDict = [
            "collegeName" : collegeName,
            "collegeAddress" : collegeAddress,
            "collegeCity" : collegeCity,
            "collegeUniversity" : collegeUniversity
        ]
        if isUpdate{
            DatabaseHelper.shareInstance.updateCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
        }else{
             DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict)
        }
        
       
    }
}
