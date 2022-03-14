//
//  SchoolViewController.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/28.
//

import UIKit

class SchoolViewController: SuperViewController {

    var schoolData: SchoolData? = nil
    var satDataArray = [SATData]()
    var satData = [Dictionary<String, String>]()
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lblNoData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchSATData()
    }
    
    
    func fetchSATData() {
        JsonAPIProvider.request(JsonAPI.fetchSATData, completion: { (result) in
            switch result {
            case .success(_):
                do {
                    let resp = try result.get()
                    self.satDataArray = try resp.map([SATData].self)
                    self.initialize()
                } catch let err {
                    print(err)
                    self.showError(message: err.localizedDescription)
                }
            case let .failure(error):
                print(error)
                self.showError(message: error.localizedDescription)
            }
        })
    }
    
    func initialize() {
        lblNoData.isHidden = true
        if let data = satDataArray.filter({ $0.dbn == schoolData?.dbn}).first {
            satData = [Dictionary<String, String>]()
            satData.append([
                "DBN" : data.dbn
            ])
            satData.append([
                "SCHOOL NAME" : data.school_name
            ])
            satData.append([
                "Num of SAT Test Takers" : data.num_of_sat_test_takers
            ])
            satData.append([
                "SAT Critical Reading Avg. Score" : data.sat_critical_reading_avg_score
            ])
            satData.append([
                "SAT Math Avg. Score" : data.sat_math_avg_score
            ])
            satData.append([
                "SAT Writing Avg. Score" : data.sat_writing_avg_score
            ])
            
        }
        updateUI()
    }
    
    
    func updateUI() {
        lblNoData.isHidden = satData.count != 0
        tableview.isHidden = satData.count == 0
        tableview.reloadData()
    }
}

extension SchoolViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return satData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SATCell") as! SATCell
        cell.setData(data: satData[indexPath.row])
        return cell
    }
    
    
}
