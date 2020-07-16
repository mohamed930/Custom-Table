//
//  TableViewCell.swift
//  TestCustom
//
//  Created by Mohamed Ali on 7/16/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel:UILabel!
    @IBOutlet weak var NameLabel:UILabel!
    @IBOutlet weak var AgeLabel:UILabel!
    @IBOutlet weak var SalaryLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
