//
//  SchoolCell.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import UIKit

class SchoolCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    func setData(data: SchoolData) {
        lblName.text = data.school_name
        lblPhone.text = data.phone_number
        lblEmail.text = data.school_email
        lblDesc.text = data.overview_paragraph
    }
    
}
