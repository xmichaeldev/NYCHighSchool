//
//  SchoolCell.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import UIKit

class SATCell: UITableViewCell {

    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValue: UILabel!
        
    func setData(data: [String: String]) {
        lblKey.text = data.keys.first
        lblValue.text = data.values.first
    }
    
}
