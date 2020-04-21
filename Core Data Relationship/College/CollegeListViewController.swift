//
//  ViewController.swift
//  Core Data Relationship
//
//  Created by AshutoshD on 30/03/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var arrCollege = [College]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        tblView.reloadData()
    }

    @IBAction func btnCollegeAddTapped(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}
extension CollegeListViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeDetailViewController") as! CollegeDetailViewController
        collegeDetailVC.collegeDetail = arrCollege[indexPath.row]
        collegeDetailVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(collegeDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "CollegeListCell", for: indexPath) as! CollegeListCell
        cell.college = arrCollege[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrCollege = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.tblView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

