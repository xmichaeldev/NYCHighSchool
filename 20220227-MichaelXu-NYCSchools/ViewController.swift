//
//  ViewController.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import UIKit

class ViewController: SuperViewController {

    @IBOutlet weak var tableview: UITableView!
    var originArray = [SchoolData]()
    var dataArray = [SchoolData]()
    @IBOutlet weak var lblNoData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchSchoolData()
    }

    func fetchSchoolData() {
        showHUD()
        JsonAPIProvider.request(JsonAPI.fetchSchools, completion: { (result) in
            self.hideHUD()
            switch result {
            case .success(_):
                do {
                    let resp = try result.get()
                    self.originArray = try resp.map([SchoolData].self)
                    self.dataArray = self.originArray
                    self.updateUI()
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
    
    func updateUI() {
        lblNoData.isHidden = self.dataArray.count != 0
        tableview.isHidden = self.dataArray.count == 0
        tableview.reloadData()
    }
    
    func filterContents(keyword: String) {
        if keyword.count == 0 {
            dataArray = originArray
        } else {
            dataArray = originArray.filter({$0.school_name.lowercased().contains(keyword.lowercased())})
        }
        self.updateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        let vc = segue.destination as? SchoolViewController
        vc?.schoolData = (sender) as? SchoolData
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell") as! SchoolCell
        cell.setData(data: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueSchool", sender: dataArray[indexPath.row])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContents(keyword: searchText)
    }
}

