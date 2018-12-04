//
//  EquipTableViewCell.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class EquipTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var eskillmax: UILabel!
    @IBOutlet weak var ename: UILabel!
    @IBOutlet weak var eimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
